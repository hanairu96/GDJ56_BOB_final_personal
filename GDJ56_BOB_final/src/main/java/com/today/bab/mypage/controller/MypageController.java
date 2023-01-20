package com.today.bab.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private MypageService service;
	
	//@Autowired
	public MypageController(MypageService service) {
		this.service=service;
	}
	
	@RequestMapping("/orderlist.do")
	public ModelAndView selectItemOrderList(ModelAndView mv) {
	
		mv.setViewName("mypage/orderlist");
		
		return mv;
	}
	
	@RequestMapping("/myinfo.do")
	public ModelAndView selectMyIfo(ModelAndView mv) {
		
		mv.setViewName("mypage/myinfo");
		
		return mv;
	}
	
	@RequestMapping("/basket.do")
	public ModelAndView selectBasket(ModelAndView mv) {
		
		mv.setViewName("mypage/basket");
		
		return mv;
	}
	
	@RequestMapping("/point.do")
	public ModelAndView selectPoint(ModelAndView mv) {
		
		mv.setViewName("mypage/point");
		
		return mv;
	}
	
	@RequestMapping("/onedayclass.do")
	public ModelAndView selectOnedayclass(ModelAndView mv) {
		
		mv.setViewName("mypage/onedayclass");
		
		return mv;
	}
	
	@RequestMapping("/writelist.do")
	public ModelAndView selectWriteList(ModelAndView mv) {
		
		mv.setViewName("mypage/writelist");
		
		return mv;
	}
	
	@RequestMapping("/subscription.do")
	public ModelAndView selectSubscription(ModelAndView mv) {
		
		mv.setViewName("mypage/subscription");
		
		return mv;
	}
	
	
}
