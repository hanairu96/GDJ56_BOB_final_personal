package com.today.bab.market2.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.today.bab.market2.controller.Emojis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.market2.model.service.MarketService;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TodayBob;
import com.today.bab.member.model.vo.Member;

@Controller
public class MarketController {
	
	private MarketService service;

	@Autowired
	public MarketController(MarketService service) {
		this.service = service;
	}

	
	//(회원)베스트
	@RequestMapping("/market/best.do")
	public ModelAndView bestItemAll(ModelAndView mv, String value) {
		//System.out.println(value); //null
		List<SellItem> list = service.bestItems(value); //베스트상품검색 - null
		
		mv.addObject("bestItems", list);
		mv.setViewName("market2/best");
		System.out.println(mv);
		return mv;
	}
	
	//(회원)베스트-가격별	
	@RequestMapping("/market/bestAjax.do")
	@ResponseBody
	public List<SellItem> bestItemAllAjax(String value) {
		//List<SellItem> list = service.bestItemsAjax(value);
		//System.out.println(value);
		List<SellItem> list = service.bestItems(value); //베스트상품검색 - ajax로 button value
		System.out.println(list);
		return list;
	}
	
	//(회원)할인
	@RequestMapping("/market/discount.do")
	public ModelAndView discountItemAll(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
		
		List<SellItem> list = service.discountView();
		int listCnt = service.discountCount();
		
		mv.addObject("m",loginMember==null?"":loginMember.getMemberId());
		
		mv.addObject("disList",list);
		mv.addObject("disCnt",listCnt);

		mv.setViewName("market2/discount");
		System.out.println(mv);
		return mv;
	}

	//(회원)추천
	@RequestMapping("/market/today.do")
	public ModelAndView todayItemAll(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    
	    System.out.println(loginMember);
		/*
		 * String loginSta; if(loginMember == null) { loginSta =
		 * loginMember.getMemberId() }else { loginSta = loginMember.getMemberId(); }
		 */
	    
		List<TodayBob> list = service.todayBobList();
		int listCnt = service.todayBobListCount();
		
		mv.addObject("m",loginMember==null?"":loginMember.getMemberId());
		
		mv.addObject("relist",list);
		mv.addObject("relistCnt",listCnt);
		
		mv.setViewName("market2/today");
		System.out.println(mv);
		return mv;
	}
	

	//(관리자)할인
	@RequestMapping("/market/discountAdmin.do")
	public ModelAndView discountAdmin(ModelAndView mv, String value) {
		
		Map<String, Object> param = new HashMap();
		param.put("value", value);
		
		System.out.println("아아"+value);
		
		List<SellItem> list = service.sellItemAll(param); //상품검색 - null
		mv.addObject("allItems",list);
		mv.setViewName("market2/discountAdmin");
		System.out.println(mv);
		return mv;
	}

	//(관리자)할인 - keyword 검색 값
	@RequestMapping("/market/discountAdminAjax.do")
	@ResponseBody
	public List<SellItem> discountAdmin(String value, String selectOp) {
		
		Map<String, Object> param = new HashMap();
		param.put("keyword", value);
		param.put("selectOp", selectOp);
		System.out.println(selectOp);
		
		List<SellItem> list = service.sellItemAll(param); //상품검색 - ajax로 키워드 검색
		return list;
	}
	
	//(관리자)할인 등록
	@RequestMapping("/market/discountAdminEnd.do")
	public ModelAndView discountAdminEnd(ModelAndView mv, String yArr, int[] chItems) {

		//배열 두개 하나의 맵으로 저장
		Map<String, Object> param = new HashMap();
		param.put("yArr", yArr.split(","));//이미 할인 중이어서 update 'n' in()할 값
		param.put("cArr", chItems);//사용자가 할인하려고 체크해서 update 'y' in()할 값
		
		/*
		//이미 할인 중이어서 update 'n' in()할 값
		System.out.println(yArr);
		//사용자가 할인하려고 체크해서 update 'y' in()할 값
		String cArr = "";
		for(String c : chItems) cArr += c+",";
		cArr = cArr.substring(0, cArr.length()-1);
		System.out.println(cArr);
		//배열 두개 하나의 맵으로 저장
		Map<String, Object> param = new HashMap();
		param.put("yArr", yArr);
		param.put("cArr", cArr);
		*/
		int result = service.discountUpdate(param);
		
		mv.addObject("msg",result>0?"할인 등록 성공":"할인 등록 실패");
		mv.addObject("loc","/market/discount.do");
		
		mv.setViewName("common/msg");//완료메세지
		return mv;
	}
	
	//(관리자)추천
	@RequestMapping("/market/todayAdmin.do")
	public ModelAndView todayAdmin(ModelAndView mv, String value, String selectOp) {
		
		mv.addObject("emojis", Emojis.getAllEmojisSortedByCategory()); //이모지
		
		
		Map<String, Object> param = new HashMap();
		param.put("keyword", value);
		param.put("selectOp", selectOp);
		
		List<SellItem> list = service.sellItemAll(param); //상품검색 - ajax로 키워드 검색
		mv.addObject("allItems",list);
		
		mv.setViewName("market2/todayAdmin");

		return mv;
	}

	//(관리자)추천 수정
	@RequestMapping("/market/todayAdminModify.do")
	public ModelAndView todayAdminModify(ModelAndView mv, String value, String selectOp) {
		List<TodayBob> titleList = service.todayBobList(); //추천제목 select에 넣어주려고
		
		
		Map<String, Object> param = new HashMap();
		param.put("keyword", value);
		param.put("selectOp", selectOp);
		
		List<SellItem> list = service.sellItemAll(param); //상품검색 - ajax로 키워드 검색
		mv.addObject("allItems",list);
		
		
		
		mv.addObject("relist",titleList);//제목
		
		
		
		mv.setViewName("market2/todayAdminModify");
		System.out.println(mv);
		return mv;
	}

	//(관리자)추천 등록 확인
	@RequestMapping("/market/checkTodayBob.do")
	public ModelAndView checkTodayBob(ModelAndView mv, String itemLS, String reTitle, String reContent, String reIcon) {
		
		/*String chItemsTxt = "";
		for(int a : chItems) {
			chItemsTxt += a+",";
		}
		chItemsTxt = chItemsTxt.substring(0, chItemsTxt.length()-1);
		System.out.println(chItemsTxt);*/
		
		List<SellItem> list = service.sellItemByNo(itemLS); //==chItemsTxt
		
		TodayBob tb = TodayBob.builder().reTitle(reTitle).reContent(reContent).reIcon(reIcon).build();
		
		//mv.addObject("chItems",chItems);//체크한상품번호
		mv.addObject("list",list);
		mv.addObject("tb",tb);
		mv.setViewName("market2/todayBobCheck");
		return mv;
	}
	
	//(관리자)추천 등록 - 타이틀생성+아이템
	@RequestMapping("/market/todayBobEnd.do")
	public ModelAndView todayBobEnd(ModelAndView mv, int[] chItems, String reTitle, String reContent, String reIcon) {
		
		System.out.println(chItems);
		
		
//		//먼저타이틀생성하고
//		TodayBob tb = TodayBob.builder().reTitle(reTitle).reContent(reContent).reIcon(reIcon).build();
//		int result = service.insertTodayBob(tb);
//		//생성한타이틀의번호가져와서
//		int no = service.selectTodayBobByTitle(reTitle);
//		System.out.println(no);
//		//상품등록하기
//		Map<String, Object> param = new HashMap();
//		param.put("no", no);
//		param.put("chItems", chItems);
//		
//		int resultEnd = service.insertTodayBobItems(param);
		
		
		Map<String, Object> param = new HashMap();
		TodayBob tb = TodayBob.builder().reTitle(reTitle).reContent(reContent).reIcon(reIcon).build();
		param.put("tb", tb);
		param.put("chItems", chItems);
		
		int resultEnd = 0; // 서비스에서 실행한 결과(반환값)를 저장할 변수
//		try {
//			
//			resultEnd = service.insertTodayBobItems(param);
//			
//		}catch(SQLException e) {
//			resultEnd = 0;
//		}
		resultEnd = service.insertTodayBobItems(param);
		
		mv.addObject("msg",resultEnd>0?"성공":"실패");
		mv.addObject("loc","/market/today.do");
		mv.setViewName("common/msg");


		return mv;
	}
	
	//(관리자)추천 삭제
	@RequestMapping("/market/deleteTodayBob.do")
	public ModelAndView deleteTodayBob(ModelAndView mv, int reNo) {
		int result = service.deleteTodayBob(reNo);
		mv.addObject("msg",result>0?"타이틀 삭제 성공":"타이틀 삭제 실패");
		mv.addObject("loc","/market/todayAdminModify.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	//(관리자)추천 상품 보기
	@RequestMapping("/market/todayView.do")
	@ResponseBody
	public List<SellItem> todayView(int reNo) {
		
		List<SellItem> list = service.todayView(reNo); //추천상품보기
		System.out.println(list);
		return list;
	}
	
	//(관리자)추천 상품 수정 - 선택한 제목에 해당하는 상품
	@RequestMapping("/market/chageItem.do")
	@ResponseBody
	public List<SellItem> selectItemByReNo(int reNo){
		
		List<SellItem> list = service.todayView(reNo);
		System.out.println(list);
		return list;
	}
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////	
//	@RequestMapping("/market/todayAdminTitle.do")//완료-> 타이틀+상품 한번에 등록하기위해주석함
//	public ModelAndView todayAdmin(ModelAndView mv, String reTitle, String reContent, String reIcon) {
//		
//		TodayBob tb = TodayBob.builder().reTitle(reTitle).reContent(reContent).reIcon(reIcon).build();
//		
//		int result = service.insertTodayBob(tb);
//		mv.addObject("msg",result>0?"타이틀 저장 성공":"타이틀 저장 실패");
//		mv.addObject("loc","/market/todayAdmin.do");
//		
//		mv.setViewName("common/msg");
//		
//		return mv;
//	}

	
	//////////////////////////////////////////////////////////////
//	@RequestMapping("/market/discountAdminAjax.do") //ajax로검색
//	@ResponseBody
//	public List<SellItem> discountAdmin(String value) {
//		List<SellItem> list = service.sellItemAll(value);
//		return list;
//	}
	
	/*	@RequestMapping("/market/discountAdmin.do")
	public ModelAndView discountAdmin(ModelAndView mv) {
		List<SellItem> list = service.sellItemAll();
		mv.addObject("allItems",list);
		mv.setViewName("market2/discountAdmin");
		System.out.println(mv);
		return mv;
	}*/
	
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

}
