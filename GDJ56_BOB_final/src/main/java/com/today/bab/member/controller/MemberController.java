package com.today.bab.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "member/login";
	}
	
	
	@RequestMapping("/loginEnd")
	public String loginEnd(String id, String password, Model model) {
		
		System.out.println(id);
		System.out.println(password);
		Member m=Member.builder().memberId(id).password(password).build();
		
		Member loginMember=service.selectMemberById(m);
		
		if(loginMember!=null) {
			model.addAttribute("loginMember", loginMember);
			System.out.println("¼º°ø");
		}
		
		return "redirect:/";
	}
	
	
	
	
	

}
