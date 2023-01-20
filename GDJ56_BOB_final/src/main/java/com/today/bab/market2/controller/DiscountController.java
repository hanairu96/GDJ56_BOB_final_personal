package com.today.bab.market2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.market2.model.service.DiscountService;
import com.today.bab.market2.model.vo.Item;

@Controller
public class DiscountController {
	
	private DiscountService service;

	@Autowired
	public DiscountController(DiscountService service) {
		this.service = service;
	}
	
	@RequestMapping("/aaa.do")
	public ModelAndView discountItemAll(ModelAndView mv) {
		List<Item> list = service.discountItemAll();
		mv.addObject("disItems",list);
		mv.setViewName("market2/disItems");
		System.out.println(mv);
		return mv;
	}
	

}
