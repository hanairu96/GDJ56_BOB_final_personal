package com.today.bab.admin.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.admin.model.service.AdminService;
import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.admin.model.vo.CqAnswer;
import com.today.bab.common.AdminPageBar;

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
	public String adminMain() {
		return "admin/adminMain";
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
//		System.out.println("구독상품 : "+asResult);
		
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
	//장인-심사
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
	public ModelAndView masterTestEnd(ModelAndView mv,String name,String masterTestText,String test) {
		
		String ing="";
		if(test.equals("'탈락'")) ing="N";
		else ing="Y";
		
		AdminMaster m=AdminMaster.builder().name(name).ing(ing).fail(masterTestText).build();
		int result=service.masterTestEnd(m);
		
		if(result>0) {
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
	public String adminQnAAll() {
		return "admin/adminQnAAll";
	}
	
	//환불관리
	@RequestMapping("/refund.do")
	public String adminRefund() {
		return "admin/adminRefund";
	}
	
	//환불-상세
	@RequestMapping("/refundInfo.do")
	public String adminRefundInfo() {
		return "admin/adminRefundInfo";
	}
	
	
}
