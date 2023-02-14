package com.today.bab.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.CookieGenerator;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.common.LoginAccessException;
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
	
	@RequestMapping("/loginpage")
	public String login() {
		return "member/loginpage";
	}
	
//	@RequestMapping("login")
//	public String loginEnd(String id, String password, Model model) {
//		
//		System.out.println(id);
//		System.out.println(password);
//		Member m=Member.builder().memberId(id).password(password).build();
//		System.out.println(m);
//		
//		Member loginMember=service.selectMemberById(m);
//		System.out.println(loginMember);
//		
//		if(loginMember!=null&&
//				//임시로 원래 비번과 암호화된 비번 확인 둘 다 하게 함
//				//입력한 비번과 암호화된 비번이 일치하는지 확인
//				(loginMember.getPassword().equals(m.getPassword())||
//				passwordEncoder.matches(m.getPassword(), loginMember.getPassword()))){
//			model.addAttribute("loginMember", loginMember);
//			System.out.println("성공");
//			return "redirect:/";
//		}else {
//			System.out.println("실패");
//			model.addAttribute("msg","입력이 잘못됐습니다.");
//			model.addAttribute("loc","/member/login");
//			return "common/msg";
//		}
//	}
	
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
		
		return data;
	}

	@RequestMapping("/nicknameDuplicateCheck")
	public void nicknameDuplicateCheck(String nickname, HttpServletResponse response) throws JsonIOException, IOException {
		
		Member m=service.nicknameDuplicateCheck(nickname);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(m, response.getWriter());

	}

	@ResponseBody
	@RequestMapping(value="/emailDuplicateCheck", method=RequestMethod.POST)
	public String emailDuplicateCheck(String email) {
		
		Member m=service.emailDuplicateCheck(email);
		Gson gson=new Gson();
		String data=gson.toJson(m);
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public String emailCheck(String email) throws Exception {
				
		Random r=new Random();
		int checkNum=r.nextInt(888888)+111111;
		
		//System.out.println("받을 이메일: "+email);
		//System.out.println("인증번호: "+checkNum);
		
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
			String inputAddressPostcode, String inputAddressAddress, String inputAddressDetailAddress, 
			MemberLike ml, ModelAndView mv) throws ParseException, RuntimeException {
//		System.out.println(m);
//		System.out.println(year);
//		System.out.println(month);
//		System.out.println(day);
//		System.out.println(inputAddressAddress);
//		System.out.println(inputAddressDetailAddress);
//		System.out.println(ml);
		
		//문자열로 받아온 생년월일을 Date 타입으로 변환
		String dateStr=year+"/"+month+"/"+day;
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy/MM/dd");
		Date date=formatter.parse(dateStr);
		//System.out.println(date);
		
		//주소를 하나로 합침
		String address="("+inputAddressPostcode+") "+inputAddressAddress+", "+inputAddressDetailAddress;
		
		//Member m에 생년월일과 주소를 set
		m.setBirth(date);
		m.setAddress(address);
		
		//체크하지 않은 음식 취향 값을 N으로 지정
		if(ml.getFruit()!='Y') ml.setFruit('N');
		if(ml.getSea()!='Y') ml.setSea('N');
		if(ml.getMeat()!='Y') ml.setMeat('N');
		if(ml.getSide()!='Y') ml.setSide('N');
		if(ml.getVege()!='Y') ml.setVege('N');
		//System.out.println(ml);

		//패스워드 암호화
		String encodePassword=passwordEncoder.encode(m.getPassword());
		m.setPassword(encodePassword);
		
		int result=service.enrollMemberEnd(m, ml);
		
		if(result>0) {
			mv.addObject("msg","회원가입 되었습니다. 가입 선물로 적립급 3000원이 지급되었습니다.");
			mv.addObject("loc","/");
		}else {
			mv.addObject("msg","회원가입이 실패하였습니다.");
			mv.addObject("loc","/member/enrollMember");
		}
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/searchIdPwd")
	public String searchIdPwd() {
		return "member/searchIdPwd";
	}
	
	@ResponseBody
	@RequestMapping(value="/emailExist", produces = "application/text; charset=UTF-8") //, method=RequestMethod.POST)
	public String emailExist(@RequestParam(value="inputs[]") List<String> inputs) {
		String choice=inputs.get(0);
		String searchId=inputs.get(1);
		String searchName=inputs.get(2);
		String searchEmail=inputs.get(3);

		//이메일로 회원 찾음
		Member member=service.selectMemberByEmail(searchEmail);
		
		String msg="";
		
		if(member==null) {
			msg="등록되지 않은 이메일입니다.";
		//비밀번호 찾기인 경우
		}else if(choice.equals("pwd")&&!member.getMemberId().equals(searchId)) {
			msg="아이디와 이메일이 일치하지 않습니다.";
		}else if(!member.getMname().equals(searchName)) {
			msg="이름과 이메일이 일치하지 않습니다.";
		}else {
			msg="성공";
		}
		
		//Gson gson=new Gson();
		//String data=gson.toJson(msg);
		String data=msg;
		
		return data;
	}

	@RequestMapping("/searchIdPwdEnd")
	public String searchIdPwdEnd(String choice, String searchEmail, Model model) {
		//이메일로 회원 아이디 찾기
		Member member=service.selectMemberByEmail(searchEmail);
		model.addAttribute("memberId", member.getMemberId());
		
		if(choice.equals("id")) {
			return "member/searchIdEnd";
		}else {
			return "member/searchPwdEnd";
		}
	}
	
	@RequestMapping("/updatePwd")
	public String updatePwd(Member m, Model model) {
		//패스워드 암호화
		String encodePassword=passwordEncoder.encode(m.getPassword());
		m.setPassword(encodePassword);
		
		int result=service.updatePwd(m);
		
		if(result>0) {
			model.addAttribute("msg","수정이 완료됐습니다.");
			model.addAttribute("loc","/member/loginpage");
		}else {
			model.addAttribute("msg","수정이 실패하였습니다.");
			model.addAttribute("loc","/member/searchPwdEnd");
		}
		return "common/msg";
	}
	
	@RequestMapping("/loginFail")
	public String loginFail() {
		//로그인 실패 시
		throw new LoginAccessException("아이디나 비밀번호가 잘못됐습니다.");
	}
	
	@RequestMapping("/loginSuccess")
	public String loginSuccess(Model m, HttpServletRequest request){
		//로그인 성공 시
		Object member=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//m.addAttribute("loginMember", Member.builder().memberId(((User)member).getUsername()).build());
		m.addAttribute("loginMember", (Member)member);

		//System.out.println(member);
		//System.out.println(m.getAttribute("loginMember"));
		//System.out.println("시큐리티 로그인 성공");
		
		String refer="";
		Cookie[] cookies = request.getCookies();
		//System.out.println("모든 쿠키: "+cookies);
		for(Cookie c: cookies) {
			if(c.getName().equals("refer")) {
				refer=c.getValue();
			}
		}
		//System.out.println("나온 쿠키: "+refer);
		
		//로그인 실패 후 로그인 했을 때는 전 주소가 로그인 매핑주소이므로 메인 화면으로 리다이렉트
		if(refer.contains("/bab/login")||refer.contains("/GDJ56_BOB_final/login")) {
			return "redirect:/";
		//이전 주소가 쿠키로 저장돼있을 경우 그 주소로 리다이렉트
		}else{
			return "redirect:"+refer;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/referrerSet")
	public boolean referrerSet(HttpServletResponse response, String refer){
		//로그인 페이지 이전 주소를 쿠키로 저장
		CookieGenerator cg = new CookieGenerator();
		
		cg.setCookieName("refer");
		cg.addCookie(response, refer);
		
		return true;
	}
	
}
