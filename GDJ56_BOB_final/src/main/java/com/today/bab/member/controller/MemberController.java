package com.today.bab.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.member.model.service.MemberService;
import com.today.bab.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
@RequestMapping("/member/")
public class MemberController {

	private MemberService service;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	@ResponseBody
	@RequestMapping(value="/idDuplicateCheck", method=RequestMethod.POST)
	public String idDuplicateCheck(String inputId) {

		Member m=service.idDuplicateCheck(inputId);
		Gson gson=new Gson();
		String data=gson.toJson(m);
		
		System.out.println(inputId);
		System.out.println(m);		
		System.out.println(data);
		
		return data;
	}

	@ResponseBody
	@RequestMapping(value="/emailDuplicateCheck", method=RequestMethod.POST)
	public String emailDuplicateCheck(String email) {
		
		Member m=service.emailDuplicateCheck(email);
		Gson gson=new Gson();
		String data=gson.toJson(m);
		
		System.out.println(email);
		System.out.println(m);		
		System.out.println(data);
		
		return data;
	}
	
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String emailCheck(String email) throws Exception {
				
		Random r=new Random();
		int checkNum=r.nextInt(888888)+111111;
		
		System.out.println("받을 이메일: "+email);
		System.out.println("인증번호: "+checkNum);
		
		String setFrom="todaysbab@naver.com";
		String toMail=email;
		String title="오늘의 밥 가입 인증번호입니다.";
		String content="안녕하세요. 오늘의 밥 사이트입니다.<br>"
				+"인증번호는 "+checkNum+"입니다.<br>"
				+"인증번호 칸에 입력해주세요.";
		
		try {            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
		
		//인증번호를 String으로 형변환
		String num=Integer.toString(checkNum);
		
		return num;
	}
	
	@RequestMapping("/enrollMemberEnd")
	public ModelAndView enrollMemberEnd(Member m, String year, String month, String day, 
			String inputAddressAddress, String inputAddressDetailAddress, 
			MemberLike ml, ModelAndView mv) throws ParseException {
		System.out.println(m);
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		System.out.println(inputAddressAddress);
		System.out.println(inputAddressDetailAddress);
		System.out.println(ml);
		
		String dateStr=year+"/"+month+"/"+day;
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MM/dd");
		Date date=formatter.parse(dateStr);
		System.out.println(date);
		
		String address=inputAddressAddress+" "+inputAddressDetailAddress;
		
		m.setBirth(date);
		m.setAddress(address);
		
		if(ml.getFruit()!='Y') ml.setFruit('N');
		if(ml.getSea()!='Y') ml.setSea('N');
		if(ml.getMeat()!='Y') ml.setMeat('N');
		if(ml.getSide()!='Y') ml.setSide('N');
		if(ml.getVege()!='Y') ml.setVege('N');
		System.out.println(ml);
		
		int result=service.enrollMemberEnd(m, ml);
		
		if(result>0) {
			mv.addObject("msg","회원가입 되었습니다.");
			mv.addObject("loc","/");
		}else {
			mv.addObject("msg","회원가입이 실패하였습니다.");
			mv.addObject("loc","/member/enrollMember");
		}
		mv.setViewName("common/msg");
		
		return mv;
	}
}
