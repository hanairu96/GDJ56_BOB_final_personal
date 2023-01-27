package com.today.bab.market1.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.market1.model.service.QnaService;
import com.today.bab.market1.model.vo.ItemQna;

@Controller
@RequestMapping("/itemQna")
public class ItemQnaController {
	private QnaService service;

	@Autowired
	public ItemQnaController(QnaService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/insertQna.do")
	public String insertQna(Model m, ItemQna a,String iqSecret) {
		System.out.println(a);
//		int result=service.insertQna(a);
//		m.addAttribute("qna",result);
		return "";
	}
	
	
}
