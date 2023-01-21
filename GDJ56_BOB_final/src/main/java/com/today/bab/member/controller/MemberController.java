package com.today.bab.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.member.model.service.MemberService;
import com.today.bab.member.model.vo.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {

	private MemberService service;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberController(MemberService service, BCryptPasswordEncoder passwordEncoder) {
		this.service = service;
		this.passwordEncoder = passwordEncoder;
	}
	
	@RequestMapping("/login")
	public String login() {
		return "/login";
	}
	
	
	@RequestMapping("/loginEnd")
	public String loginEnd(Member m, HttpSession session) {
		
		//Member m=Member.builder().memberId(id).password(password).build();

		Member loginMember=service.selectMemberById(m);
		
		if(loginMember!=null) {
			session.setAttribute("loginMember", loginMember);
		}
		
		return "redirect:/";
	}
	
	
	
	
	

}
