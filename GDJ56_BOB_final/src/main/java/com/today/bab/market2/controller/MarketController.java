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
	
	@RequestMapping("/aaa.do")
	public ModelAndView discountItemAll(ModelAndView mv) {
		List<SellItem> list = service.discountItemAll();
		mv.addObject("disItems",list);
		mv.setViewName("market2/discountView");
		System.out.println(mv);
		return mv;
	}
	

}
