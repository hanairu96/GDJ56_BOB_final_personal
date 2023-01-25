package com.today.bab.onedayclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OneDayController {
	
	@RequestMapping("/class/main.do")
	public String oneDayClassMain() {
		return "onedayclass/onedayMain";
	}


}
