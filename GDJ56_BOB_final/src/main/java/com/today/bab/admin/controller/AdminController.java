package com.today.bab.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.admin.model.service.AdminService;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminSubscription;
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
		System.out.println(m);
		
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
		
		System.out.println(result);
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
	public String adminMaster() {
		return "admin/adminMaster";
	}
	
	//장인-상세보기
	@RequestMapping("/masterInfo.do")
	public String adminMasterInfo() {
		return "admin/adminMasterInfo";
	}
	
	//장인-심사
	@RequestMapping("/masterTest.do")
	public String adminMasterTest() {
		return "admin/adminMasterTest";
	}
	
	//상품관리
	@RequestMapping("/product.do")
	public String adminProduct() {
		return "admin/adminProduct";
	}
	
	//1:1답변관리
	@RequestMapping("/QnA.do")
	public String adminQnA() {
		return "admin/adminQnA";
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
