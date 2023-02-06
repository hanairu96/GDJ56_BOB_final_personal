package com.today.bab.basket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.basket.model.service.BasketService;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.MarketBasket;

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
	public String insertbasket(int itemNo,String memberId,Model m) {
		MarketBasket b=MarketBasket.builder()
				.itemNo(itemNo)
				.memberId(memberId)
				.build();
		int result=service.insertbasket(b);
		if(result>0) { 
			m.addAttribute("msg","장바구니에 상품을 담았습니다.");
			m.addAttribute("loc","/market1/marketgtg.do");
		}else {
			m.addAttribute("msg","장바구니에 상품 담기를 실패하였습니다.");
			m.addAttribute("loc","/market1/marketgtg.do");
		}
		return "common/msg";
	}
	
	@RequestMapping("/updatebasket.do")
	public String updateBasket(int itemNo,String memberId,Model m) {
		MarketBasket b=MarketBasket.builder()
				.itemNo(itemNo)
				.memberId(memberId)
				.build();
		int result=service.updateBasket(b);
		if(result>0) { 
			m.addAttribute("msg","장바구니에 상품을 담았습니다.");
			m.addAttribute("loc","/market1/marketgtg.do");
		}else {
			m.addAttribute("msg","장바구니에 상품 담기를 실패하였습니다.");
			m.addAttribute("loc","/market1/marketgtg.do");
		}
		return "common/msg";
		
		
	}
	
}
