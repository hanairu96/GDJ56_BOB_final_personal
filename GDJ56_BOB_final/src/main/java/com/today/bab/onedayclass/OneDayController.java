package com.today.bab.onedayclass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.onedayclass.model.service.OneDayService;
import com.today.bab.onedayclass.model.vo.AdminMaster;
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
		return "onedayclass/onedaymenu-"+type;
	}
	
	@RequestMapping("/class/search.do")
	public String selectSearchClass(Model m, String search, String searchlist) {

	   Map<String, Object> param = new HashMap();
	   param.put("type", searchlist);
	   param.put("keyword", search);
	   List<OneDayClass> classlist = service.selectSearchClass(param);
	   m.addAttribute("classlist",classlist);
	   m.addAttribute("param", param);
	   return "onedayclass/onedaySearchResult";
	}
	
	@RequestMapping("/class/masterEnroll.do")
	public String masterEnroll() {
		return "onedayclass/onedayMasterSubmit";
	}

	@RequestMapping("/class/masterEndEnroll.do")
	public String masterEndEnroll(AdminMaster m) {
		System.out.println(m);
		return "d";
	}
	
	
	


}
