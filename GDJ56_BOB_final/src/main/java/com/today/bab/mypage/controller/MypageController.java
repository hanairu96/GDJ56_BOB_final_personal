package com.today.bab.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.common.MypagePageBar;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.member.model.vo.Member;
import com.today.bab.mypage.model.service.MypageService;
import com.today.bab.mypage.model.vo.ClientQaMypage;
import com.today.bab.mypage.model.vo.ItemDetail;
import com.today.bab.mypage.model.vo.ItemOrder;
import com.today.bab.mypage.model.vo.ItemOrderSellitem;
import com.today.bab.mypage.model.vo.MarketRe;
import com.today.bab.mypage.model.vo.MypageQnaAll;
import com.today.bab.mypage.model.vo.OnedayRe;
import com.today.bab.mypage.model.vo.OnedayclassMember;
import com.today.bab.mypage.model.vo.Point;
import com.today.bab.mypage.model.vo.Sub;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private MypageService mypageService;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MypageController(MypageService mypageService,BCryptPasswordEncoder passwordEncoder) {
		this.mypageService=mypageService;
		this.passwordEncoder=passwordEncoder;
	}
	
	@RequestMapping("/orderlist.do")
	public ModelAndView selectItemOrderList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="cPage", defaultValue = "1") int cPage,
			@RequestParam(value="numPerpage", defaultValue = "5") int numPerpage) {
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    //System.out.println(m+"ddddd");
	    List<ItemOrder> orderlist=mypageService.selectItemOrderList(Map.of("cPage",cPage,"numPerpage",numPerpage),m.getMemberId());
	    int totalData=mypageService.selectItemOrderListCount(m.getMemberId());
	    List<ItemOrderSellitem> itemlist =mypageService.selectOrderSellItem(m.getMemberId());
	    //System.out.println(itemlist);
	    
	    mv.addObject("pageBar",MypagePageBar.getPage(cPage, numPerpage, totalData, "orderlist.do"));
	    mv.addObject("orderlist",orderlist);
	    mv.addObject("itemlist",itemlist);
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(m.getMemberId());
	    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);
	    
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
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(loginMember.getMemberId());
	    memberInfoBar.add(loginMember.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(loginMember.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(loginMember.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(loginMember.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);
	    
	    
		AdminMember member=AdminMember.builder().memberId(loginMember.getMemberId()).password(myinfoPassword).build();
		
		//System.out.println(loginMember+"??");
		
		AdminMember m=mypageService.selectMyInfo(member);//비밀번호 맞는지 확인
		
		boolean result=passwordEncoder.matches(myinfoPassword, loginMember.getPassword());
		//System.out.println(result);
		
		if(!result) { //비밀번호가 틀린 경우
			mv.addObject("msg", "비밀번호가 틀렸습니다.");
			mv.addObject("loc","/mypage/myinfoPassword.do");
			mv.setViewName("common/msg");
			
			return mv;
			
		}else { //비밀번호가 맞는 경우
			ArrayList address=new ArrayList();
			address.add(loginMember.getAddress().subSequence(1, 6)); //우편번호
			address.add(loginMember.getAddress().substring(8, loginMember.getAddress().indexOf(","))); //주소
			address.add(loginMember.getAddress().substring(loginMember.getAddress().indexOf(",")+1)); //상세주소
			
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
	      
	      ArrayList memberInfoBar = new ArrayList();
		    memberInfoBar.add(m.getMemberId());
		    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
		    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
		    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
		    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
		    
		    mv.addObject("memberInfoBar",memberInfoBar);
	      
	      //System.out.println(b);
	      
	      return mv;
	   }
	
	@RequestMapping("/point.do")
	public ModelAndView selectPoint(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="cPage", defaultValue = "1") int cPage,
			@RequestParam(value="numPerpage", defaultValue = "5") int numPerpage) {
		
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
		
	    List<Point> pointlist = mypageService.selectListPoint(Map.of("cPage",cPage,"numPerpage",numPerpage),m.getMemberId());
	    //System.out.println(pointlist);
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(m.getMemberId());
	    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);
	   
	    int totalData=mypageService.selectListPointCount(m.getMemberId());
	    //System.out.println(totalData);
	    mv.addObject("pageBar",MypagePageBar.getPage(cPage, numPerpage, totalData, "point.do"));
	    mv.addObject("pointlist",pointlist);
	    
	    
	    
		mv.setViewName("mypage/point");
		
		return mv;
	}
	
	@RequestMapping("/onedayclass.do")
	public ModelAndView selectOnedayclass(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="cPage", defaultValue = "1") int cPage,
			@RequestParam(value="numPerpage", defaultValue = "3") int numPerpage) {
		
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    
	    String memberMaster = mypageService.selectMemberMaster(m.getMemberId());
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(m.getMemberId());
	    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);
	    
//	    if(memberMaster.equals("Y")) {
//	    	List<OneDayClass> odc = mypageService.selectOnedayclassMaster(m.getMemberId());
//	    	mv.addObject("master",odc);
//	    	System.out.println(odc+"마스터");
//	    }
	    
	    List<OdcReserve> odcReserve = mypageService.selectOnedayclass(Map.of("cPage",cPage,"numPerpage",numPerpage),m.getMemberId());
	    
	    int totalData=mypageService.selectOnedayclassCount(m.getMemberId());
	    
	    //System.out.println("count"+totalData);
	    
	    mv.addObject("pageBar",MypagePageBar.getPage(cPage, numPerpage, totalData, "onedayclass.do"));
	    
	    mv.addObject("odcReserve",odcReserve);
	    mv.addObject("memberMaster",memberMaster);
	    //System.out.println(odcReserve+"신청");
		mv.setViewName("mypage/onedayclass");
		
		return mv;
	}
	
	@RequestMapping("/writelist.do")
	public ModelAndView selectWriteList(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="cPage", defaultValue = "1") int cPage,
			@RequestParam(value="numPerpage", defaultValue = "5") int numPerpage) {
		
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    
	    List<ClientQaMypage> qa = mypageService.selectQaList(Map.of("cPage",cPage,"numPerpage",numPerpage),m.getMemberId());
		
	    int totalData=mypageService.selectQaListCount(m.getMemberId());
	    
	    mv.addObject("pageBar",MypagePageBar.getPage(cPage, numPerpage, totalData, "writelist.do"));
	    mv.addObject("qa",qa);
	    //System.out.println(qa);
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(m.getMemberId());
	    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);
	    
		mv.setViewName("mypage/writelist");
		
		return mv;
	}
	
	@RequestMapping("/subscription.do")
	public ModelAndView selectSubscription(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="cPage", defaultValue = "1") int cPage,
			@RequestParam(value="numPerpage", defaultValue = "2") int numPerpage) {
		
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    
	    List<Sub> sub = mypageService.selectSubscription(Map.of("cPage",cPage,"numPerpage",numPerpage),m.getMemberId());
		
	    int totalData=mypageService.selectSubscriptionCount(m.getMemberId());
	    
	    mv.addObject("pageBar",MypagePageBar.getPage(cPage, numPerpage, totalData, "subscription.do"));
	    mv.addObject("sub",sub);
	    //System.out.println(sub);
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(m.getMemberId());
	    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);
		
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
	public ModelAndView basketOrderList(String[] basketss,HttpServletRequest request,ModelAndView mv) throws JsonProcessingException{
		
		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
		
	    //System.out.println(Arrays.toString(basketss));
	    
	   List<Basket> orderitemlist= mypageService.basketOrderList(basketss);
	   
	   //System.out.println(orderitemlist);
	   
	   //List sellItemNo=new ArrayList();
	   HashMap<Integer, Integer> sellItemNoCount = new HashMap<Integer, Integer>();
	   for(int i=0;i<orderitemlist.size();i++) {
		   //System.out.println(orderitemlist.get(i).getItem().get(0).getItemNo());
		   sellItemNoCount.put(orderitemlist.get(i).getItem().get(0).getItemNo(),orderitemlist.get(i).getItemCount());
	   }
	   
	   HashMap<Integer, String> saleInfo = new HashMap<Integer, String>();
	   for(int i=0;i<orderitemlist.size();i++) {
		   //System.out.println(orderitemlist.get(i).getItem().get(0).getItemNo());
		   saleInfo.put(orderitemlist.get(i).getItem().get(0).getItemNo(),orderitemlist.get(i).getItem().get(0).getItemDiscount());
	   }
	   
	   //System.out.println();
	   
	   ObjectMapper mapper=new ObjectMapper();
	   mv.addObject("orderitemlist",orderitemlist);
	   mv.addObject("basketss",Arrays.toString(basketss));
	   mv.addObject("sellItemNoCount",mapper.writeValueAsString(sellItemNoCount));
	   mv.addObject("pointAll",mypageService.selectpointAll(loginMember.getMemberId()));
	   mv.addObject("saleInfo",mapper.writeValueAsString(saleInfo));
	   mv.addObject("memberEmail",loginMember.getEmail());
	    mv.setViewName("mypage/order");
	    return mv;
	}
	
	
	@RequestMapping("/pay.do")
	public void insertItemOrder(String orderComment,int price,String buyer_addr,String buyer_name,String buyer_tel,String merchant,
			int use_point, String basketss, String sellItemNoCount, String saleInfo,
			HttpServletRequest request,HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    
	    //System.out.println(saleInfo);
	    //saleinfo
	    ObjectMapper salemapper = new ObjectMapper();
        HashMap<Integer, String> salemap = new HashMap<Integer, String>();
        
        salemap = salemapper.readValue(saleInfo, 
                new TypeReference<HashMap<Integer, String>>() {}); 
	    //saleinfo

	    ItemOrder io=ItemOrder.builder().price(price)
		.memberId(loginMember.getMemberId()).orderName(buyer_name)
		.address(buyer_addr).orderPhone(buyer_tel).orderComment(orderComment).merchantUid(merchant).pointUse(use_point).build();
	    
	    //System.out.println(io);
	   // System.out.println(basketss);
	    //System.out.println(sellItemNoCount);

	    String[] dbasket=basketss.substring(1,basketss.length()-1).substring(0).split(",");
	    //String[] sellItemNoCounts=sellItemNoCount.substring(1,sellItemNoCount.length()-1).split(",");
	    
	    ObjectMapper mapper = new ObjectMapper();
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        
        map = mapper.readValue(sellItemNoCount, 
                new TypeReference<HashMap<Integer, Integer>>() {});        
        
        //System.out.println(map);
	    
	    List<ItemDetail> ids=new ArrayList();

	    Iterator it = map.entrySet().iterator();
	    while (it.hasNext()) {
	        Map.Entry<Integer, Integer> entry = (Map.Entry)it.next();
	        //System.out.println(entry.getKey() + " = " + entry.getValue()); 
	        ItemDetail id=ItemDetail.builder().itemNo(entry.getKey()).count(entry.getValue()).build();
	        ids.add(id);
	    }
	    
	    for(int i=0;i<ids.size();i++) {
	    	for ( int key : salemap.keySet() ) {
	    		if(ids.get(i).getItemNo()==key){
	    			ids.get(i).setSaleInfo(salemap.get(key));
	    		}
	    	}	
	    }
	    
	   // System.out.println(ids);
	    //System.out.println(use_point+"d");
	    Point usepoint=Point.builder().memberId(loginMember.getMemberId()).pointChange(use_point).build();
	    
		int result=mypageService.insertItemOrder(io,ids,dbasket,usepoint);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
	
	@RequestMapping("/orderdetail")
	public ModelAndView selectSubscription(ModelAndView mv,int orderNo) {
		
		List<ItemReview> io = mypageService.selectReviewByOrderNo(orderNo);
		
		ArrayList reviewItemNo = new ArrayList();
		
		for(int i=0;i<io.size();i++) {
			reviewItemNo.add(io.get(i).getItemNo());
		}
		
		
	
		mv.addObject("reviewItemNo",reviewItemNo);
		mv.addObject("itemdetail",mypageService.selectListItemDetail(orderNo));
		mv.addObject("orderdetail",mypageService.selectOrderDetail(orderNo));
		
		mv.setViewName("mypage/orderdetail");
		
		return mv;
	}
	
	@RequestMapping("/ordercancel")
	public void updateOrderCancel(int orderNo,String comment,HttpServletResponse response) throws IOException {
		
		ItemOrder io=ItemOrder.builder().orderNo(orderNo).refundMsg(comment).build();
		
		int result=mypageService.updateOrderCancel(io);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
	
	@RequestMapping("/orderconfirm")
	public void updateOrderConfirm(int orderNo,HttpServletResponse response) throws IOException {
		
		int result=mypageService.updateOrderConfirm(orderNo);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
	
	@RequestMapping("/onedayclass/master")
	public ModelAndView selectOnedayclassMaster(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="cPage", defaultValue = "1") int cPage,
			@RequestParam(value="numPerpage", defaultValue = "5") int numPerpage) {
		
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    
	    List<OneDayClass> odc = mypageService.selectOnedayclassMaster(Map.of("cPage",cPage,"numPerpage",numPerpage),m.getMemberId());
	    mv.addObject("master",odc);
	    //System.out.println(odc+"마스터");
	    
	    int totalData=mypageService.selectOnedayclassMasterCount(m.getMemberId());
	    
	    //System.out.println("count"+totalData);
	    
	    mv.addObject("pageBar",MypagePageBar.getPage(cPage, numPerpage, totalData, "onedayclass.do"));
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(m.getMemberId());
	    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);

	    mv.addObject("odc",odc);
		mv.setViewName("mypage/master");
		
		return mv;
	}
	
	@RequestMapping("/onedayclass/masterdetail")
	public ModelAndView selectOnedayclassMaster(ModelAndView mv,HttpServletRequest request,int odcNo,String start,String end) {
		
		HttpSession session = request.getSession();
	    Member m = (Member) session.getAttribute("loginMember");
	    //System.out.println(start);
	    //System.out.println(end);
	    mv.addObject("odcNo",odcNo);
	    mv.addObject("start",start);
	    mv.addObject("end",end);
		mv.setViewName("mypage/masterdetail");
		
		return mv;
	}
	
	@RequestMapping("/onedayclassMember")
	@ResponseBody
	public List<OnedayclassMember> selectOnedayclassMember(int odcNo,String odcDate,HttpServletResponse response) throws IOException {
		
		List<OnedayclassMember> ocm=mypageService.selectOnedayclassMember(Map.of("odcNo",odcNo,"odcDate",odcDate));
		//System.out.println(ocm);
		response.setContentType("text/csv;charset=utf-8");
		//response.setContentType("application/json;charset=utf-8");
		//response.getWriter().print(ocm);
		
		return ocm;
	}
	
	@RequestMapping("/deleteSub")
	public void deleteSub(int subNo,HttpServletResponse response) throws IOException {
		
		int result=mypageService.deleteSub(subNo);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
	
	@RequestMapping("/onedayItemWrite.do")
	public ModelAndView selectMypageQnaAll(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="cPage", defaultValue = "1") int cPage,
			@RequestParam(value="numPerpage", defaultValue = "5") int numPerpage) {

		HttpSession session = request.getSession();
	    Member m = (Member)session.getAttribute("loginMember");

	    List<MypageQnaAll> mqa = mypageService.selectMypageQnaAll(Map.of("cPage",cPage,"numPerpage",numPerpage),m.getMemberId());
	    
	    int totalData=mypageService.selectMypageQnaAllCount(m.getMemberId());
	    
	    mv.addObject("pageBar",MypagePageBar.getPage(cPage, numPerpage, totalData, "onedayItemWrite.do"));
	    
	    mv.addObject("mqa",mqa);
	    //System.out.println(mqa);
	    
	    ArrayList memberInfoBar = new ArrayList();
	    memberInfoBar.add(m.getMemberId());
	    memberInfoBar.add(m.getGrade()=='Y'?"장인":"일반");
	    memberInfoBar.add(mypageService.selectBasketAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectWriteAllCount(m.getMemberId()));
	    memberInfoBar.add(mypageService.selectRecentPoint(m.getMemberId()));
	    
	    mv.addObject("memberInfoBar",memberInfoBar);
	    
		mv.setViewName("mypage/onedayItemWrite");
		
		return mv;
	}		
	
	@RequestMapping("/itemReply")
	@ResponseBody
	public List<MarketRe> selectMarketRe(int qnaNo,HttpServletResponse response) throws IOException {
		
		List<MarketRe> reply = mypageService.selectMarketRe(qnaNo);
			
		response.setContentType("text/csv;charset=utf-8");
		
		return reply;
	}

	@RequestMapping("/onedayReply")
	@ResponseBody
	public List<OnedayRe> selectOnedayRe(int qnaNo,HttpServletResponse response) throws IOException {
		
		List<OnedayRe> reply = mypageService.selectOnedayRe(qnaNo);
		//System.out.println(reply);
		response.setContentType("text/csv;charset=utf-8");
		
		return reply;
	}
	
	@RequestMapping("/updatePassword")
	public void updatePassword(String pw,HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		String encodePassword=passwordEncoder.encode(pw);
		//System.out.println(encodePassword);
		
		HttpSession session = request.getSession();
	    Member m = (Member)session.getAttribute("loginMember");
	    
	    m.setPassword(encodePassword);
		
		int result=mypageService.updatePassword(m);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
}
