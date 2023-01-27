package com.today.bab.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.member.model.vo.Member;
import com.today.bab.mypage.model.service.MypageService;
import com.today.bab.mypage.model.vo.ItemOrder;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private MypageService mypageService;
	
	//@Autowired
	public MypageController(MypageService mypageService) {
		this.mypageService=mypageService;
	}
	
	@RequestMapping("/orderlist.do")
	public ModelAndView selectItemOrderList(ModelAndView mv,HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    //System.out.println("dd"+m.getMemberId());
		mv.addObject("memberId",m.getMemberId());
		mv.setViewName("mypage/orderlist");
		
		return mv;
	}
	
	//마이페이지-회원정보 비밀번호입력
	@RequestMapping("/myinfoPassword.do")
	public ModelAndView myinfoPassword(ModelAndView mv,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    
		mv.addObject("memberId",m.getMemberId());
		mv.setViewName("mypage/myinfoPassword");
		
		return mv;
	} 
	
	//마이페이지-회원정보 내용출력
	@RequestMapping("/myinfo.do")
	public ModelAndView selectMyInfo(ModelAndView mv,HttpServletRequest request,String myinfoPassword) {
		
		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    
		AdminMember member=AdminMember.builder().memberId(loginMember.getMemberId()).password(myinfoPassword).build();
		
		AdminMember m=mypageService.selectMyInfo(member);//비밀번호 맞는지 확인
		
		if(m==null) { //비밀번호가 틀린 경우
			mv.addObject("msg", "비밀번호가 틀렸습니다.");
			mv.addObject("loc","/mypage/myinfoPassword.do");
			mv.setViewName("common/msg");
			
			return mv;
			
		}else { //비밀번호가 맞는 경우
			ArrayList address=new ArrayList();
			address.add(m.getAddress().subSequence(1, 6)); //우편번호
			address.add(m.getAddress().substring(8, m.getAddress().indexOf(","))); //주소
			address.add(m.getAddress().substring(m.getAddress().indexOf(",")+1)); //상세주소
			
			mv.addObject("address",address); //전체주소
			mv.addObject("m", m); //회원정보+선호식품
			
			ArrayList memberlike=new ArrayList(); //선호식품 체크한거
			ArrayList memberhate=new ArrayList(); //선호식품 체크안한거
			
			if(m.getMemberlike().getFruit()=='Y') { //체크했으면 memberlike에 add, 체크안했으면 memberhate에 add
				memberlike.add("과일");
			}else {
				memberhate.add("과일");
			}
			
			if(m.getMemberlike().getMeat()=='Y') {
				memberlike.add("육류");
			}else {
				memberhate.add("육류");
			}
			
			if(m.getMemberlike().getSea()=='Y') {
				memberlike.add("수산물");
			}else {
				memberhate.add("수산물");
			}
			
			if(m.getMemberlike().getSide()=='Y') {
				memberlike.add("반찬");
			}else {
				memberhate.add("반찬");
			}
			
			if(m.getMemberlike().getVege()=='Y') {
				memberlike.add("채소");
			}else {
				memberhate.add("채소");
			}
			mv.addObject("memberlike", memberlike); //선호O
			mv.addObject("memberhate", memberhate); //선호X
			
			mv.setViewName("mypage/myinfo");
			
			return mv;
		}
		
		
	}
	//마이페이지-회원정보 수정
	@RequestMapping("/updateMypage.do")
	public ModelAndView updateMypage(ModelAndView mv,HttpServletRequest request,String updateName
			,char gender,String updateEmail,String updatePhone,String updateAdd1,
			String updateAdd2,String updateAdd3,String updateLike) {
		
		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
		
		String updateAddress="("+updateAdd1+") "+updateAdd2+","+updateAdd3; //전체주소
		
		MemberLike ml=new MemberLike(loginMember.getMemberId(),'N','N','N','N','N'); //선호식품 기본값 N으로 생성
		if(updateLike!=null) { //선호식품 체크가 존재하면
			String[] updateMemberLike=updateLike.split(","); //선호식품 배열로 저장
			
			for(int i=0;i<updateMemberLike.length;i++) { 
				switch (updateMemberLike[i]) { //선호식품 체크한 것들 Y로 변경
					case "과일": ml.setFruit('Y'); break;
					case "육류": ml.setMeat('Y'); break;
					case "수산물": ml.setSea('Y'); break;
					case "반찬": ml.setSide('Y'); break;
					case "채소": ml.setVege('Y'); break;
				}
			}
		}
		
		AdminMember am=AdminMember.builder().memberId(loginMember.getMemberId()).mname(updateName).gender(gender)
											.email(updateEmail).phone(updatePhone).address(updateAddress)
											.build();
		
		int result1=mypageService.updateMember(am); //회원정보update
		int result2=mypageService.updateMemberLike(ml); //선호식품update
		
		if(result1>0 && result2>0) {
			mv.addObject("msg","수정 성공");
		}else {
			mv.addObject("msg","수정 실패");
		}
		mv.addObject("loc","/mypage/myinfoPassword.do");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	@RequestMapping("/basket.do")
	   public ModelAndView selectBasketById(ModelAndView mv,HttpServletRequest request) {
	      
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	      
	      //System.out.println("아이디"+m.getMemberId());
	      
	      //String userId="user02"; //임의로 저장 -> 동민이가 멤버 만들면 그때 값 넘어와서 고치기
	      List<Basket> b=mypageService.selectBasketById(m.getMemberId());
	      
	      mv.addObject("basket",b);
	      mv.setViewName("mypage/basket");
	      
	      System.out.println(b);
	      
	      return mv;
	   }
	
	@RequestMapping("/point.do")
	public ModelAndView selectPoint(ModelAndView mv) {
		
		mv.setViewName("mypage/point");
		
		return mv;
	}
	
	@RequestMapping("/onedayclass.do")
	public ModelAndView selectOnedayclass(ModelAndView mv) {
		
		mv.setViewName("mypage/onedayclass");
		
		return mv;
	}
	
	@RequestMapping("/writelist.do")
	public ModelAndView selectWriteList(ModelAndView mv) {
		
		mv.setViewName("mypage/writelist");
		
		return mv;
	}
	
	@RequestMapping("/subscription.do")
	public ModelAndView selectSubscription(ModelAndView mv) {
		
		mv.setViewName("mypage/subscription");
		
		return mv;
	}
	
	@RequestMapping("/updateBasketCount.do")
	public void updateBasketCount(int itemCount,int basketNo,HttpServletResponse response) throws IOException {
		
		
		int result=mypageService.updateBasketCount(Basket.builder() 
				.basketNo(basketNo).itemCount(itemCount).build());
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
	
	@RequestMapping("/deleteBasketCount.do")
	public void deleteBasketCount(int dbasketNo,HttpServletResponse response) throws IOException {
		
		
		int result=mypageService.deleteBasketCount(dbasketNo);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
	
	@RequestMapping("/basket/order.do")
	public ModelAndView basketOrderList(String[] basketss,HttpServletRequest request,ModelAndView mv){
		
		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
		
	    System.out.println(Arrays.toString(basketss));
	    
	   List<Basket> orderitemlist= mypageService.basketOrderList(basketss);
	   
	   System.out.println(orderitemlist);
	   
	   
	   mv.addObject("orderitemlist",orderitemlist);
	    
	    mv.setViewName("mypage/order");
	    return mv;
	}
	
	
	@RequestMapping("/pay.do")
	public void insertItemOrder(String orderComment,int price,String buyer_addr,String buyer_name,String buyer_tel, HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
		
	    ItemOrder io=ItemOrder.builder().price(price)
		.memberId(loginMember.getMemberId()).orderName(buyer_name)
		.address(buyer_addr).orderPhone(buyer_tel).orderComment(orderComment).build();
	    
	    System.out.println(io);
		int result=mypageService.insertItemOrder(io);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
}
