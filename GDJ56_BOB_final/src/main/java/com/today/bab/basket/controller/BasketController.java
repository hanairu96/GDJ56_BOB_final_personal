package com.today.bab.basket.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.basket.model.service.BasketService;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	private BasketService service;
	
	@Autowired
	public BasketController(BasketService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/insertbasket.do")
	public String insertbasket(int itemNo,String memberId,int add,Model m) {
		int result=service.insertbasket(Map.of("itemNo",itemNo,"memberId",memberId,"add",add));
		
		if(result>0) { 
			m.addAttribute("msg","장바구니에 상품을 담았습니다.");
			if(add==0) {
				m.addAttribute("loc","/market1/marketgtg.do");
			}else {
				m.addAttribute("loc","/market1/marketdetail.do?itemNo="+itemNo);
			}
		}else {
			m.addAttribute("msg","장바구니에 상품 담기를 실패하였습니다.");
			if(add==0) {
				m.addAttribute("loc","/market1/marketgtg.do");
			}else {
				m.addAttribute("loc","/market1/marketdetail.do?itemNo="+itemNo);
			}
		}
		return "common/msg";
	}
	
	@RequestMapping("/updatebasket.do")
	public String updateBasket(int itemNo,String memberId,int add,Model m) {
//		MarketBasket b=MarketBasket.builder()
//				.itemNo(itemNo)
//				.memberId(memberId)
//				.build();
		
		
		
		int result=service.updateBasket(Map.of("itemNo",itemNo,"memberId",memberId,"add",add));
		if(result>0) { 
			m.addAttribute("msg","장바구니에 상품을 담았습니다.");
			if(add==0) {
				m.addAttribute("loc","/market1/marketgtg.do");
			}else {
				m.addAttribute("loc","/market1/marketdetail.do?itemNo="+itemNo);
			}
		}else {
			m.addAttribute("msg","장바구니에 상품 담기를 실패하였습니다.");
			if(add==0) {
				m.addAttribute("loc","/market1/marketgtg.do");
			}else {
				m.addAttribute("loc","/market1/marketdetail.do?itemNo="+itemNo);
			}
		}
		return "common/msg";
		
		
	}
	
}
