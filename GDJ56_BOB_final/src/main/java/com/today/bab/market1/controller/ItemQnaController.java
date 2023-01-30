package com.today.bab.market1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.market1.model.service.QnaService;
import com.today.bab.market1.model.vo.ItemQna;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.member.model.vo.Member;

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
	public String insertQna(Model m, ItemQna a,
			String iqContent, String memberId, int itemNo,
			String iqSecret) {

		if(iqSecret==null) {
			iqSecret="N";
		}
		ItemQna i=ItemQna.builder()
				.iqContent(iqContent)
//				.memberId(Member.builder().memberId(memberId).build())
				.memberId(memberId)
//				.itemNo(SellItem.builder().itemNo(itemNo).build())
				.itemNo(itemNo)
				.iqSecret(iqSecret)
				.build();
		System.out.println(i);
		
//		int result=service.insertQna(a);
//		m.addAttribute("qna",result);
		return "";
	}
	
	@RequestMapping("/selectQna.do")
	public String selectQna(Model m) {
		List<ItemQna> qq=service.selectQnaList();
		System.out.println(qq);
//		m.addAttribute("ii",qq);
//		return "market1/marketGtg";
		return "";
	}
	
	
	
}
