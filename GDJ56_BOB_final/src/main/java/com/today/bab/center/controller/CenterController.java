package com.today.bab.center.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.center.model.service.CenterService;

@Controller
@RequestMapping("/center/")
public class CenterController {
	
	private CenterService service;
	
	@Autowired
	public CenterController(CenterService service) {
		this.service = service;
	}
	
	@RequestMapping("/noticeList")
	public String noticeList() {
		return "center/noticeList";
	}

	@RequestMapping("/clientQnaList")
	public String clientQnaList() {
		return "center/clientQnaList";
	}
	

}
