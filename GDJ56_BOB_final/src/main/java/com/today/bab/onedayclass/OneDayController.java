package com.today.bab.onedayclass;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.onedayclass.model.service.OneDayService;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Controller
public class OneDayController {
	
	private OneDayService service;
	
	@Autowired
	public OneDayController(OneDayService service) {
		this.service=service;
	}
	
	@RequestMapping("/class/main.do")
	public ModelAndView oneDayClassMain(ModelAndView mv) {
		
		List<OneDayClass> classlist = service.selectClassList();

		mv.addObject("classlist",classlist);
		mv.setViewName("onedayclass/onedayMain");
		return mv;
	}
	
	@RequestMapping("/class/menu.do")
	public String oneDayClassBob(Model m,String type) {
		List<OneDayClass> classlist = service.selectMenuClassList(type);
		m.addAttribute("classlist",classlist);
		System.out.println(classlist);
		return "onedayclass/onedaymenu-"+type;
	}
	
	@RequestMapping("/class/search.do")
	public String classSearch(String search, String searchlist) {
		System.out.println(search);
		System.out.println(searchlist);
		return "one";
	}
	
	
	


}
