package com.today.bab.admin.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.admin.model.service.AdminService;
import com.today.bab.admin.model.vo.AdminItemOrder;
import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminSearch;
import com.today.bab.admin.model.vo.AdminSellItem;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.admin.model.vo.AdminTotalData;
import com.today.bab.admin.model.vo.AdminTotalProduct;
import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.admin.model.vo.CqAnswer;
import com.today.bab.common.AdminPageBar;
import com.today.bab.common.AdminPageBar2;
import com.today.bab.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
//@SessionAttributes({"loginMember"})
public class AdminController {
	
	private AdminService service;
	
	@Autowired
	public AdminController(AdminService service) {
		this.service=service;
	}
	
	//관리자페이지 메인
	@RequestMapping("/main.do")
	public ModelAndView adminMain(ModelAndView mv) {
		List<AdminTotalData> atd=service.adminTotalData();
		List<AdminTotalProduct> atp=service.adminTotalProduct();
		
		mv.addObject("num1",atp.get(0));
		mv.addObject("num2",atp.get(1));
		mv.addObject("num3",atp.get(2));
		mv.addObject("num4",atp.get(3));
		mv.addObject("num5",atp.get(4));
		mv.addObject("num6",atp.get(5));
		mv.addObject("num7",atp.get(6));
		
		mv.addObject("profit",atd.get(0).getTotal());
		mv.addObject("sales",atd.get(1).getTotal());
		mv.addObject("members",atd.get(2).getTotal());
		mv.setViewName("admin/adminMain");
		
		return mv;
	}
	
	//회원관리
	@RequestMapping("/members.do")
	public ModelAndView adminMembers(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		mv.addObject("list",service.adminMembers(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		
		//페이징처리하기
		int totalData=service.selectMemberListCount();
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "members.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("admin/adminMembers");
		
		return mv;
	}
	
	//회원관리-상세보기
	@RequestMapping("/membersInfo.do")
	public ModelAndView adminMembersInfo(ModelAndView mv,String id) {
		AdminMember m=service.adminmemberInfo(id); //회원정보+선호식품
		List<AdminSubscription> as=service.adminSubscription(id); //구독정보+구독식품
		
		mv.addObject("m",m); //회원정보
		
		ArrayList memberlike=new ArrayList();
		if(m.getMemberlike().getFruit()=='Y') {
			memberlike.add("과일");
		}if(m.getMemberlike().getMeat()=='Y') {
			memberlike.add("육류");
		}if(m.getMemberlike().getSea()=='Y') {
			memberlike.add("수산물");
		}if(m.getMemberlike().getSide()=='Y') {
			memberlike.add("반찬");
		}if(m.getMemberlike().getVege()=='Y') {
			memberlike.add("채소");
		}
		
		ArrayList asResult=new ArrayList();
		
		for(int i=0;i<as.size();i++) {
			asResult.add(as.get(i).getSubItem().getSubName());
		}
		
		mv.addObject("memberlike",memberlike); //선호음식
		mv.addObject("asResult",asResult); //구독상품
		mv.setViewName("admin/adminMembersInfo");
		
		return mv;
	}
	
	//회원 탈퇴
	@RequestMapping("/adminDeleteMember.do")
	public ModelAndView adminDeleteMember(String memberId,ModelAndView mv) {
		int result=service.adminDeleteMember(memberId);
		
		if(result>0) {
			mv.addObject("msg","탈퇴 성공");
			mv.addObject("loc","/admin/members.do");
		}else {
			mv.addObject("msg","탈퇴 실패");
			mv.addObject("loc","/admin/membersInfo.do");
		}
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//클래스 장인 관리
	@RequestMapping("/master.do")
	public ModelAndView adminMaster(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		int ingData=service.selectMasterIngListCount(); //심사필요한사람
		
		
		mv.addObject("list",service.adminMaster(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		//페이징처리하기
		int yesData=service.selectMasterListCount(); //장인인사람
		int totalData=service.selectMasterAllListCount(); //전체
		
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "master.do"));
		
		mv.addObject("ingData",ingData);
		mv.addObject("yesData",yesData);
		mv.setViewName("admin/adminMaster");
		
		return mv;
	}
	
	//장인-상세보기
	@RequestMapping("/masterInfo.do")
	public ModelAndView adminMasterInfo(ModelAndView mv,String name) throws ParseException {
		AdminMaster master=service.adminMasterInfo(name); //장인+원데이클래스
		
		String[] history=master.getHistory().split(","); //활동이력 배열로 저장

		ArrayList classIng=new ArrayList();
		ArrayList classEnd=new ArrayList();
		
		if(master.getOnedayclass1().size()>0) { //개설한 원데이클래스가 있는경우
			for(int j=0;j<master.getOnedayclass1().size();j++) { //원데이클래스
				if(master.getOnedayclass1().get(j).getOdcClassName()==null) {
					
				}else {
					java.util.Date utilDate = new java.util.Date(); //util현재날짜
//				    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); //sql로 변환
					
				    if(utilDate.before(master.getOnedayclass1().get(j).getOdcEndDate())){ 
				    	
				    	classIng.add(master.getOnedayclass1().get(j));
				    	
		            } else { //현재날짜가 종료날짜보다 후 일때 (종료된 클래스)
		            	classEnd.add(master.getOnedayclass1().get(j));
		            }
				}
			}
		}
		
		mv.addObject("history",history);
		mv.addObject("classIng", classIng);
		mv.addObject("classEnd", classEnd);
		mv.addObject("master", master);
		
		mv.setViewName("admin/adminMasterInfo");
		
		return mv;
	}
	
	//장인-박탈
	@RequestMapping("/masterDelete.do")
	public ModelAndView masterDelete(ModelAndView mv,String memberId,String masterDeleteText) {
		
		AdminMaster m=AdminMaster.builder().memberId(memberId).fail(masterDeleteText).build();
		
		int result1=service.masterDelete(m);
		int result2=service.masterDelete2(memberId);
		
		if(result1>0&&result2>0) {
			mv.addObject("msg","장인 박탈 완료");
			mv.addObject("loc","/admin/master.do");
		}else {
			mv.addObject("msg","장인 박탈 실패");
			mv.addObject("loc","/admin/master.do");
		}
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	//장인-심사 내용출력
	@RequestMapping("/masterTest.do")
	public ModelAndView adminMasterTest(ModelAndView mv,String name) {
		
		AdminMaster master=service.adminMasterInfo(name); //장인+원데이클래스
		String[] history=master.getHistory().split(","); //활동이력 배열로 저장
		
		mv.addObject("history",history);
		mv.addObject("master",master);
		mv.setViewName("admin/adminMasterTest");
		
		return mv;
	}
	
	//장인-심사 : 탈락/승인 처리
	@RequestMapping("/masterTestEnd.do")
	public ModelAndView masterTestEnd(ModelAndView mv,String name,String masterTestText,String test,String masterId) {
		
		String ing="";
		if(test.equals("'탈락'")) ing="N";
		else ing="Y";
		int result1=1;
		
		AdminMaster m=AdminMaster.builder().memberId(masterId).name(name).ing(ing).fail(masterTestText).build();
		int result=service.masterTestEnd(m); //장인테이블 변경
		
		if(ing.equals("Y")) {
			result1=service.masterTestEnd2(m); //회원등급 Y(장인)으로 변경
		}
		
		if(result>0&&result1>0) {
			mv.addObject("msg","심사 저장 완료");
			mv.addObject("loc","/admin/master.do");
		}else {
			mv.addObject("msg","심사 저장 실패");
			mv.addObject("loc","/admin/master.do");
		}
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//1:1답변관리
	@RequestMapping("/QnA.do")
	public ModelAndView adminQnA(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		mv.addObject("list",service.selectQnAList(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		
		//페이징처리하기
		int totalData=service.selectQnACount(); //전체
		
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "QnA.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("admin/adminQnA");
		
		return mv;
	}
	
	//1:1답변상세보기
	@RequestMapping("/QnaInfo.do")
	public ModelAndView qnaInfo(ModelAndView mv,int cqNo) {
		mv.addObject("cqNo",cqNo);
		ClientQNA cq=service.selectQna(cqNo);
		mv.addObject("cq",cq);
		mv.setViewName("admin/qnaInfo");
		
		return mv;
	}
	
	//1:1답변등록
	@RequestMapping("/QnAEnd.do")
	public ModelAndView qnAEnd(ModelAndView mv,String qnaAnswer,int cqNo) {
		
		CqAnswer cq=CqAnswer.builder().cqaContent(qnaAnswer).qnaNo(cqNo).build();
		int result=service.insertqnaAnswer(cq);
		int result2=service.updateClientQNA(cqNo);
		
		if(result>0&&result2>0) {
			mv.addObject("msg","답변 저장 완료");
			mv.addObject("loc","/admin/QnA.do");
		}else {
			mv.addObject("msg","답변 저장 실패");
			mv.addObject("loc","/admin/QnA.do");
		}
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//문의관리
	@RequestMapping("/QnAAll.do")
	public ModelAndView adminQnAAll(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		mv.addObject("list",service.adminQnAAll(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		
		//페이징처리하기
		int totalData=service.adminQnAAllCount(); //마켓+원데이 수
		
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "QnAAll.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("cateG","전체");
		mv.setViewName("admin/adminQnAAll");
		
		return mv;
		
	}
	
	//문의관리-마켓
	@RequestMapping("/qnAMarket.do") 
	public ModelAndView qnAMarket(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		mv.addObject("list",service.adminQnAMarket(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		//페이징처리하기
		int totalData=service.qnAMarketCount(); //마켓 수
		
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "qnAMarket.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("cateG","마켓");
		mv.setViewName("admin/adminQnAAll");
		
		return mv;
		
	}
	
	//문의관리-원데이
	@RequestMapping("/qnAOneday.do")
	public ModelAndView qnAOneday(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		mv.addObject("list",service.adminQnAOneDay(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		//페이징처리하기
		int totalData=service.qnAOnedayCount(); //원데이 수
		
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "qnAOneday.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("cateG","원데이");
		mv.setViewName("admin/adminQnAAll");
		
		return mv;
		
	}
	
	//환불관리
	@RequestMapping("/refund.do")
	public ModelAndView adminRefund(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		mv.addObject("list",service.adminRefund(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		
		//페이징처리하기
		int totalData=service.adminRefundCount(); //환불신청 건수
		
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "refund.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("admin/adminRefund");
		
		return mv;
	}
	
	//환불처리
	@RequestMapping("/refundEnd.do")
	public void orderCancle(String merchant_uid, int cancel_request_amount, String reason,
	HttpServletResponse response)throws IOException {
		
		AdminItemOrder cancelOrder = service.selectcancelOrder(merchant_uid);
		
		String result="";
		String end="";
	    if(!"".equals(cancelOrder.getMerchantUid())) {
	        String token = service.getToken(); //토큰발급
	        service.payMentCancle(token,cancelOrder.getMerchantUid(), cancel_request_amount, reason); //토큰,uid,환불금액,환불사유 로 환불요청
	        result="성공";
	    }else {
	    	 result="실패";
	    }
	    
	    if(result.equals("성공")) {
	    	int result2=service.updateItemOrder(cancelOrder);
	    	int result3=1;
	    	
	    	if(result2>0) {
	    		if(cancelOrder.getPointUse()>0) {
		    		result3=service.insertPoint(cancelOrder);
		    	}
	    	}
	    	if(result2>0&&result3>0) {
	    		end="환불 승인 완료";
	    	}else {
	    		end="환불 승인 실패";
	    	}
	    }else {
	    	end="환불 승인 실패";
	    }
	    response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(end);
	}
	
	//상품관리
	@RequestMapping("/product.do")
	public ModelAndView adminProductList(ModelAndView mv,
		@RequestParam(value="cPage", defaultValue="1") int cPage,
		@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {

		mv.addObject("list",service.adminProductList(Map.of("cPage",cPage,"numPerpage",numPerpage)));
		//페이징처리하기
		int totalData=service.adminProductCount(); 
		
		mv.addObject("pageBar",AdminPageBar.getPage(cPage, numPerpage, totalData, "product.do"));
		mv.addObject("totalData",totalData);
		mv.setViewName("admin/adminProduct");
		
		return mv;
	}
	
	//회원검색
	@RequestMapping("/memberSearch.do")
	public ModelAndView memberSearchClass(ModelAndView mv, String search, String searchlist,
			int cpage, int numPerpage) {	
		
		if(searchlist.equals("searchNo")) {
			AdminSearch as=AdminSearch.builder().cpage(cpage).numPerpage(numPerpage).type(searchlist)
					.keyword(search).build();
			
			mv.addObject("totalData",0);
			mv.addObject("as", as);
			mv.setViewName("admin/memberSearch");
		}else {
			AdminSearch as=AdminSearch.builder().cpage(cpage).numPerpage(numPerpage).type(searchlist)
					.keyword(search).build();
			
	        List<Member> list = service.memberSearchClass(as);
	        
		    //페이징처리하기
			int totalData=service.memberSearchClassCount(as);
			
			mv.addObject("pageBar",AdminPageBar2.getPage(cpage, numPerpage, totalData, "memberSearch.do"));
			mv.addObject("totalData",totalData);
			mv.addObject("list",list);
		    mv.addObject("as", as);
			mv.setViewName("admin/memberSearch");
		}
		return mv;
	}
	
	//장인검색
	@RequestMapping("/masterSearch.do")
	public ModelAndView masterSearchClass(ModelAndView mv, String search, String searchlist,
		int cpage, int numPerpage) {	

		if(searchlist.equals("searchNo")) {
			AdminSearch as=AdminSearch.builder().cpage(cpage).numPerpage(numPerpage).type(searchlist)
					.keyword(search).build();
			
			mv.addObject("totalData",0);
			mv.addObject("as", as);
			mv.setViewName("admin/masterSearch");
		}else {
			AdminSearch as=AdminSearch.builder().cpage(cpage).numPerpage(numPerpage).type(searchlist)
					.keyword(search).build();
			
	        List<AdminMaster> list = service.masterSearchClass(as);
	        
		    //페이징처리하기
			int totalData=service.masterSearchClassCount(as);
			
			//페이징처리하기
			int yesData=service.masterSearchClassYesCount(as); //장인인사람
			int ingData=service.masterSearchClassIngCount(as); //심사필요한사람
			
			mv.addObject("ingData",ingData);
			mv.addObject("yesData",yesData);
			
			mv.addObject("pageBar",AdminPageBar2.getPage(cpage, numPerpage, totalData, "masterSearch.do"));
			mv.addObject("totalData",totalData);
			mv.addObject("list",list);
		    mv.addObject("as", as);
			mv.setViewName("admin/masterSearch");
		}
		return mv;
	}
	
	//상품검색
	@RequestMapping("/productSearch.do")
	public ModelAndView productSearchClass(ModelAndView mv, String search, String searchlist,
		int cpage, int numPerpage) {	

		if(searchlist.equals("searchNo")) {
			AdminSearch as=AdminSearch.builder().cpage(cpage).numPerpage(numPerpage).type(searchlist)
					.keyword(search).build();
			
			mv.addObject("totalData",0);
			mv.addObject("as", as);
			mv.setViewName("admin/productSearch");
		}else {
			AdminSearch as=AdminSearch.builder().cpage(cpage).numPerpage(numPerpage).type(searchlist)
					.keyword(search).build();
			
	        List<AdminSellItem> list = service.productSearchClass(as);
	        
		    //페이징처리하기
			int totalData=service.productSearchClassCount(as);
			
			//페이징처리하기
			mv.addObject("pageBar",AdminPageBar2.getPage(cpage, numPerpage, totalData, "productSearch.do"));
			mv.addObject("totalData",totalData);
			mv.addObject("list",list);
		    mv.addObject("as", as);
			mv.setViewName("admin/productSearch");
		}
		return mv;
	}
		
}
