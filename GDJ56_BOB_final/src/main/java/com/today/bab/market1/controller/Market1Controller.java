package com.today.bab.market1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.market1.model.service.Market1Service;

@Controller
@RequestMapping("/market1")
public class Market1Controller {
	
	private Market1Service service;

	@Autowired
	public Market1Controller(Market1Service service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/matketmain.do")
	public ModelAndView Marketmain(ModelAndView mv) {
		mv.setViewName("market1/marketMain");
		return mv;
	}
	
}
