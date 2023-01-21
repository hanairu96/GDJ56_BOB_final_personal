package com.today.bab.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.admin.model.service.AdminService;

@Controller
//@SessionAttributes({"loginMember"})
public class AdminController {
	
private AdminService service;
	
	@Autowired
	public AdminController(AdminService service) {
		this.service=service;
	}
	
	@RequestMapping("/admin/main.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/admin/members.do")
	public String adminMembers() {
		return "admin/adminMembers";
	}
	
	@RequestMapping("/admin/membersInfo.do")
	public String adminMembersInfo() {
		return "admin/adminMembersInfo";
	}
	
	@RequestMapping("/admin/master.do")
	public String adminMaster() {
		return "admin/adminMaster";
	}
	
	@RequestMapping("/admin/masterInfo.do")
	public String adminMasterInfo() {
		return "admin/adminMasterInfo";
	}
	
	@RequestMapping("/admin/masterTest.do")
	public String adminMasterTest() {
		return "admin/adminMasterTest";
	}
	
	@RequestMapping("/admin/product.do")
	public String adminProduct() {
		return "admin/adminProduct";
	}
	
	@RequestMapping("/admin/QnA.do")
	public String adminQnA() {
		return "admin/adminQnA";
	}
	
	@RequestMapping("/admin/QnAAll.do")
	public String adminQnAAll() {
		return "admin/adminQnAAll";
	}
	
	@RequestMapping("/admin/refund.do")
	public String adminRefund() {
		return "admin/adminRefund";
	}
	
	@RequestMapping("/admin/refundInfo.do")
	public String adminRefundInfo() {
		return "admin/adminRefundInfo";
	}
	
	
}
