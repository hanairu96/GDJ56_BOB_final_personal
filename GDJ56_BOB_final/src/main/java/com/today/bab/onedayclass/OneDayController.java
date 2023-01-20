package com.today.bab.onedayclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OneDayController {
	
	private OneDayService service;
	
	@Autowired
	public OneDayController(OneDayService service) {
		this.service=service;
	}
	
	@RequestMapping("/onedayclass")
	public String goIndex() {
		
		return "";
}

}
