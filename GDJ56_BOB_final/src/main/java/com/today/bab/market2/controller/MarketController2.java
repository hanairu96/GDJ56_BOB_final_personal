package com.today.bab.market2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.market2.model.service.DiscountService;

@Controller
public class MarketController2 {
	
	private DiscountService service;

	@Autowired
	public MarketController2(DiscountService service) {
		this.service = service;
	}
	
	@RequestMapping("/aaa.do")
	public 
	

}
