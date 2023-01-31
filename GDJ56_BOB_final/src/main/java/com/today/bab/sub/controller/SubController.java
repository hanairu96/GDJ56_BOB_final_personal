package com.today.bab.sub.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.sub.model.service.SubService;

@Controller
@RequestMapping("/subscription/")
public class SubController {
	
	private SubService service;
	
	@Autowired
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

	@RequestMapping("/insertSub")
	public String insertSub(String memberId, String choice) {
		
		Map<String, Object> param=new HashMap();
		param.put("id", memberId);
		param.put("choice", choice);
		System.out.println(memberId);
		System.out.println(choice);
		
		int result=service.insertSub(param);
		
		if(result>0) {
			System.out.println("성공");
		}
		
		return "subscription/subApply";
	}
	
}
