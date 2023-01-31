package com.today.bab.sub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.sub.model.service.SubService;

@Controller
@RequestMapping("/subscription/")
public class SubController {
	
	private SubService service;

	public SubController(SubService service) {
		this.service = service;
	}
	
	@RequestMapping("/subMain")
	public String subMain() {
		return "subscription/subMain";
	}

	@RequestMapping("/subApply")
	public String subApply() {
		return "subscription/subApply";
	}
	
}
