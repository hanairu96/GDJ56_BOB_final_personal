package com.today.bab.market2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.common.Market2PageBar;
import com.today.bab.market2.model.service.MarketService;
import com.today.bab.market2.model.vo.SellItem;

@Controller
public class MarketController {
	
	private MarketService service;

	@Autowired
	public MarketController(MarketService service) {
		this.service = service;
	}
	
	
	
	//.tab 페이징처리, 100개만, 할인상품만, 매개변수로 값 받아서 동적쿼리만들기
	@RequestMapping("/market/best.do")
	public ModelAndView bestItemAll(ModelAndView mv) {

		mv.setViewName("market2/best");
		System.out.println(mv);
		return mv;
	}
//페이징처리
//	@RequestMapping("/market/discount.do")
//	public ModelAndView BoardList(ModelAndView mv
//			, @RequestParam(value="cPage", defaultValue="1") int cPage
//			, @RequestParam(value="numPerpage", defaultValue="5") int numPerpage		) {
//		List<SellItem> list = service.sellItemAll(Map.of("cPage",cPage,"numPerpage",numPerpage));
//		mv.addObject("lists", list);
//		//System.out.println(list);
//		
//		int totalData = service.sellItemAllCount();
//		mv.addObject("pageBar", Market2PageBar.getPage(cPage, numPerpage, totalData, "/market/discount.do"));
//		mv.addObject("totalContents",totalData);
//		mv.setViewName("market2/discount");
//		System.out.println(mv);
//		return mv;
//	}
	@RequestMapping("/market/today.do")
	public ModelAndView todayItemAll(ModelAndView mv) {

		mv.setViewName("market2/today");
		System.out.println(mv);
		return mv;
	}
	//tab./
	
	@RequestMapping("/market/discountAdmin.do")
	public ModelAndView discountAdmin(ModelAndView mv) {
		List<SellItem> list = service.sellItemAll();
		mv.addObject("allItems",list);
		mv.setViewName("market2/discountAdmin");
		System.out.println(mv);
		return mv;
	}
	@RequestMapping("/market/discountAdminEnd.do") //완료
	public ModelAndView discountAdminEnd(ModelAndView mv, String yArr, String[] chItems) {

		//배열 두개 하나의 맵으로 저장
		Map<String, Object> param = new HashMap();
		param.put("yArr", yArr.split(","));//이미 할인 중이어서 update 'n' in()할 값
		param.put("cArr", chItems);//사용자가 할인하려고 체크해서 update 'y' in()할 값
		
		
//		//이미 할인 중이어서 update 'n' in()할 값
//		System.out.println(yArr);
//		//사용자가 할인하려고 체크해서 update 'y' in()할 값
//		String cArr = "";
//		for(String c : chItems) cArr += c+",";
//		cArr = cArr.substring(0, cArr.length()-1);
//		System.out.println(cArr);
//		//배열 두개 하나의 맵으로 저장
//		Map<String, Object> param = new HashMap();
//		param.put("yArr", yArr);
//		param.put("cArr", cArr);
		
		
		
		int result = service.discountUpdate(param);
		mv.addObject("msg",result>0?"할인 등록 성공":"할인 등록 실패");
		mv.addObject("loc","/market/discount.do");
		
		mv.setViewName("common/msg");//완료메세지
		return mv;
	}
	@RequestMapping("/market/todayAdmin.do")
	public ModelAndView todayAdmin(ModelAndView mv) {

		mv.setViewName("market2/todayAdmin");

		return mv;
	}
	@RequestMapping("/market/todayAdminModify.do")
	public ModelAndView todayAdminModify(ModelAndView mv) {

		mv.setViewName("market2/todayAdminModify");
		System.out.println(mv);
		return mv;
	}
	

}
