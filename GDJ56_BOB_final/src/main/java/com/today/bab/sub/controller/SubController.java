package com.today.bab.sub.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@ResponseBody
	@RequestMapping("/insertSub")
	public boolean insertSub(String memberId, String choice) {
		
		Map<String, Object> param=new HashMap();
		param.put("id", memberId);
		param.put("choice", choice);
		System.out.println(memberId);
		System.out.println(choice);
		
		int result=service.insertSub(param);
		
		//결제 성공 여부
		boolean data=false;
		
		if(result>0) {
			System.out.println("성공");
			data=true;
		}else {
			System.out.println("실패");
		}
		
		return data;
	}
	
}
