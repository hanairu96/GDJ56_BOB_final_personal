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
		System.out.println(m);
		
		Member loginMember=service.selectMemberById(m);
		System.out.println(loginMember);
		
		if(loginMember!=null&&loginMember.getPassword().equals(m.getPassword())) {
			model.addAttribute("loginMember", loginMember);
			System.out.println("성공");
			return "redirect:/";
		}else {
			System.out.println("실패");
			model.addAttribute("msg","입력이 잘못됐습니다.");
			model.addAttribute("loc","/member/login");
			return "common/msg";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus session) {
		if(!session.isComplete()) {
			session.setComplete();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/enrollAgree")
	public String enrollAgree() {
		return "member/enrollAgree";
	}

	@RequestMapping("/enrollMember")
	public String enrollMember() {
		return "member/enrollMember";
	}

}
