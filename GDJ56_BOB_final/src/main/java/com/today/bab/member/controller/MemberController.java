package com.today.bab.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.today.bab.member.model.service.MemberService;
import com.today.bab.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
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
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus session) {
		if(!session.isComplete()) {
			session.setComplete();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/enrollMember")
	public String enrollMember() {
		return "member/enrollMember";
	}

}
