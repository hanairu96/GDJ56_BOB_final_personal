package com.today.bab.market2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.market2.model.service.MarketService;
import com.today.bab.market2.model.vo.SellItem;

@Controller
public class MarketController {
	
	private MarketService service;

	@Autowired
	public MarketController(MarketService service) {
		this.service = service;
	}
	
	///.tab
	@RequestMapping("/market/best.do")
	public ModelAndView bestItemAll(ModelAndView mv) {
		List<SellItem> list = service.discountItemAll();
		mv.addObject("disItems",list);
		mv.setViewName("market2/best");
		System.out.println(mv);
		return mv;
	}
	@RequestMapping("/market/discount.do")
	public ModelAndView discountItemAll(ModelAndView mv) {
		List<SellItem> list = service.discountItemAll();
		mv.addObject("disItems",list);
		mv.setViewName("market2/discount");
		System.out.println(mv);
		return mv;
	}
	@RequestMapping("/market/today.do")
	public ModelAndView todayItemAll(ModelAndView mv) {
		List<SellItem> list = service.discountItemAll();
		mv.addObject("disItems",list);
		mv.setViewName("market2/today");
		System.out.println(mv);
		return mv;
	}
	//tab./
	
	@RequestMapping("/market/discountAdmin.do")
	public ModelAndView discountAdmin(ModelAndView mv) {

		mv.setViewName("market2/discountAdmin");

		return mv;
	}
	@RequestMapping("/market/todayAdmin.do")
	public ModelAndView todayAdmin(ModelAndView mv) {

		mv.setViewName("market2/todayAdmin");

		return mv;
	}
	@RequestMapping("/market/todayAdminModify.do")
	public ModelAndView todayAdminModify(ModelAndView mv) {

		mv.setViewName("market2/todayAdminModify");

		return mv;
	}
	

}
