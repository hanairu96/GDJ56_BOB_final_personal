package com.today.bab;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.member.model.vo.Member;
import com.today.bab.onedayclass.model.service.OneDayService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private OneDayService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome Today's BoB!!!", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//로그인한 Member 객체를 받아옴
		Object member=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(member);
		
		//로그인한 member가 존재할 때
		if(!member.equals("anonymousUser")) {
			//Member의 아이디로 AdminMaster 객체 찾음
			System.out.println(member);
			System.out.println(((Member)member).getMemberId());
			AdminMaster master=service.selectMastserById(((Member)member).getMemberId());
			System.out.println(master);
			model.addAttribute("master", master);
		}
		return "index";
	}
	
}
