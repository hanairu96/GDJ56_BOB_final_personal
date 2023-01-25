package com.today.bab.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.basket.model.vo.Basket;
import com.today.bab.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private MypageService mypageService;
	
	//@Autowired
	public MypageController(MypageService mypageService) {
		this.mypageService=mypageService;
	}
	
	@RequestMapping("/orderlist.do")
	public ModelAndView selectItemOrderList(ModelAndView mv) {
	
		mv.setViewName("mypage/orderlist");
		
		return mv;
	}
	
	@RequestMapping("/myinfo.do")
	public ModelAndView selectMyIfo(ModelAndView mv) {
		
		mv.setViewName("mypage/myinfo");
		
		return mv;
	}
	
	@RequestMapping("/basket.do")
	public ModelAndView selectBasketById(ModelAndView mv) {
		
		String userId="user02"; //임의로 저장 -> 동민이가 멤버 만들면 그때 값 넘어와서 고치기
		List<Basket> b=mypageService.selectBasketById(userId);
		
		mv.addObject("basket",b);
		mv.setViewName("mypage/basket");
		
		System.out.println(b);
		
		return mv;
	}
	
	@RequestMapping("/point.do")
	public ModelAndView selectPoint(ModelAndView mv) {
		
		mv.setViewName("mypage/point");
		
		return mv;
	}
	
	@RequestMapping("/onedayclass.do")
	public ModelAndView selectOnedayclass(ModelAndView mv) {
		
		mv.setViewName("mypage/onedayclass");
		
		return mv;
	}
	
	@RequestMapping("/writelist.do")
	public ModelAndView selectWriteList(ModelAndView mv) {
		
		mv.setViewName("mypage/writelist");
		
		return mv;
	}
	
	@RequestMapping("/subscription.do")
	public ModelAndView selectSubscription(ModelAndView mv) {
		
		mv.setViewName("mypage/subscription");
		
		return mv;
	}
	
	@RequestMapping("/updateBasketCount.do")
	public void updateBasketCount(int itemCount,int basketNo,HttpServletResponse response) throws IOException {
		
		
		int result=mypageService.updateBasketCount(Basket.builder() 
				.basketNo(basketNo).itemCount(itemCount).build());
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
	
	@RequestMapping("/deleteBasketCount.do")
	public void deleteBasketCount(int dbasketNo,HttpServletResponse response) throws IOException {
		
		
		int result=mypageService.deleteBasketCount(dbasketNo);
		
		response.setContentType("text/csv;charset=utf-8");
		response.getWriter().print(result);
	}
}
