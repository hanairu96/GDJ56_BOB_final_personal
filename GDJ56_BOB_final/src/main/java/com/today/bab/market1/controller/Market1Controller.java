package com.today.bab.market1.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.basket.model.service.BasketService;
import com.today.bab.common.Market1Pagebar;
import com.today.bab.market1.model.service.Market1Service;
import com.today.bab.market1.model.service.QnaService;
import com.today.bab.market1.model.service.ReviewItemService;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.MarketBasket;
import com.today.bab.market1.model.vo.MarketMemberLike;
import com.today.bab.market2.model.service.MarketService;
import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TodayBob;
import com.today.bab.member.model.vo.Member;

@Controller
@RequestMapping("/market1")
public class Market1Controller {
	
	private Market1Service service;
	private QnaService qnaservice;
	private ReviewItemService reservice;
	private BasketService bservice;
	private MarketService market2service;
	
	@Autowired
	public Market1Controller(Market1Service service,QnaService qnaservice, ReviewItemService reservice,BasketService bservice,MarketService market2service) {
		super();
		this.service = service;
		this.qnaservice = qnaservice;
		this.reservice=reservice;
		this.bservice=bservice;
		this.market2service=market2service;
	}
	
	
//	private String picrename(MultipartFile pic, String path) {
//		String renameFile="";
//		if(pic!=null) {
//			String picName=pic.getOriginalFilename();
//			String ex=picName.substring(picName.lastIndexOf("."));
//			SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmss");
//			int rnd=(int)(Math.random()*10000)+1;
//			renameFile=sim.format(System.currentTimeMillis()+"_"+rnd+ex);
//			try {
//				pic.transferTo(new File(path+renameFile));
//			}catch(IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return renameFile;
//	}
	
	//INDEX에서 마켓 메인 이동 
	@RequestMapping("/matketmain.do")
	public ModelAndView marketmain(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="12")int numPerpage
			,HttpServletRequest request) {
		List<SellItem> list=service.selectItemMarket();
		mv.addObject("items",list);
		
		//회원 선호리스트 뽑아주기
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
	    
		if(loginMember!=null) {
			String memberId=loginMember.getMemberId();
			MarketMemberLike like=service.memberLike(memberId);
			if(like!=null) {
//			System.out.println(like);
				List addlike=new ArrayList();
				String choice="";
				
				//선택지가 모두 y인것만 추가
				if(like.getFruit().equals("Y")) {
					choice="과일";
					addlike.add(choice);
				}if(like.getSea().equals("Y")) {
					choice="수산";
					addlike.add(choice);
				}if(like.getMeat().equals("Y")) {
					choice="정육";
					addlike.add(choice);
				}if(like.getSide().equals("Y")) {
					choice="반찬";
					addlike.add(choice);
				}if(like.getVege().equals("Y")) {
					choice="채소";
					addlike.add(choice);
				}
				mv.addObject("likectg",addlike);
				
				if(addlike.size()!=0) {
					List<SellItem> likesell=new ArrayList();
					for(int i=0;i<addlike.size();i++) {
						likesell.addAll(service.selectMainLike((String) addlike.get(i)));
					}
					mv.addObject("likemenu",likesell);
				}
			}
		}
		
		//메인에추천
		List<TodayBob> relist = market2service.todayBobList();
		mv.addObject("relist",relist);
		List<SellItem> relistbyno0 = market2service.todayView(relist.get(0).getReNo());
		List<SellItem> relistbyno1 = market2service.todayView(relist.get(1).getReNo());
		mv.addObject("relistbyno0",relistbyno0);
		mv.addObject("relistbyno1",relistbyno1);
		
		
//		마감임박상품 
		List<SellItem> soon=service.soldoutsoon(Map.of("cPage",cPage,"numPerpage",numPerpage));
		List<SellItem> reco=service.recommendman(Map.of("cPage",cPage,"numPerpage",numPerpage));
		mv.addObject("soon", soon);
		mv.addObject("reco", reco);
		
		mv.setViewName("market1/marketMain");
		return mv;
	}
	
	//상품 카테고리로 이동
	@RequestMapping("/marketgtg.do")
	public ModelAndView marketCtg(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="15")int numPerpage
			,HttpServletRequest request) {

		List<SellItem> list=service.selectItemCtg(Map.of("cPage",cPage,"numPerpage",numPerpage));
		
		//페이징 처리하기 
		int totaldata=service.selectItemCount();
		mv.addObject("pageBar",Market1Pagebar.getPage(cPage, numPerpage,totaldata,"marketgtg.do"));
		
		//회원이 장바구니 제품을 담았을때 장바구니에 있는 상품들 리스트 
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
		if(loginMember!=null) {
			List<MarketBasket> blist=bservice.selectBasket(loginMember.getMemberId());
			mv.addObject("basket",blist);
		}
		mv.addObject("i",list);
		mv.setViewName("market1/marketGtg");
		return mv;
	}
	
	//상품 상세페이지로 이동
	@RequestMapping("/marketdetail.do")
	public ModelAndView marketdetail(ModelAndView mv,int itemNo,HttpServletRequest request) {
		SellItem list=service.marketdetail(itemNo);
		
		mv.addObject("de",list);
		String file="";
		int count=0;
		for(ItemPic i : list.getIpic()) {
			if(count++!=0) file+=",";
			file+=i.getPicName();
		}
		mv.addObject("picpic",file);
		mv.addObject("qna",qnaservice.selectQnaList(itemNo));
		List<ItemReview> review=reservice.selectReviewAll(itemNo);
		mv.addObject("reviews",review);
		if(!review.isEmpty()) {
			int avg=reservice.selectAvg(itemNo);
			mv.addObject("reavg",avg);
		}
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
		if(loginMember!=null) {
			List<MarketBasket> blist=bservice.selectBasket(loginMember.getMemberId());
			mv.addObject("basket",blist);
		}
		mv.setViewName("market1/detailMarketItem");
		return mv;
	}
	
	//마켓 상품 등록 페이지 이동
	@RequestMapping("/insertmarket.do")
	public ModelAndView insertgo(ModelAndView mv) {
		mv.setViewName("market1/insertMarketItem");
		return mv;
	}
	
	//상품 등록
	@RequestMapping("/insertMarketItem.do")
	public ModelAndView insertItem(ModelAndView mv, MultipartFile[] imgFile,
			String itemBrand,String itemName,int itemPrice,int delPrice,String madeIn,
			String weight,MultipartFile mainPic,String mainContent,String itemContent,String itemPoint,
			String itemKeep,String itemTip,MultipartFile itemLabel,String itemCategory,String itemStock
			,HttpSession session) {

		//상세사진 경로
		String path=session.getServletContext().getRealPath("/resources/upload/market/detail/");
		
		//메인 사진, 라벨 사진 경로
		String path1=session.getServletContext().getRealPath("/resources/upload/market/mainlabel/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdir();
		
		List<ItemPic> files=new ArrayList();
		
		SellItem s=SellItem.builder()
				.itemBrand(itemBrand).itemBrand(itemBrand)
				.itemName(itemName).itemPrice(itemPrice).delPrice(delPrice).madeIn(madeIn)
				.weight(weight)
				.mainContent(mainContent)
				.itemContent(itemContent).itemPoint(itemPoint).itemKeep(itemKeep).itemTip(itemTip)
				.itemCategory(itemCategory).itemStock(itemStock)
				.build();
		
		if(mainPic!=null) {
			String picName=mainPic.getOriginalFilename();
			String ex=picName.substring(picName.lastIndexOf("."));
			SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*10000)+1;
			String renameFile=sim.format(System.currentTimeMillis())+"_"+rnd+ex;
			try {
				mainPic.transferTo(new File(path1+renameFile));
				s.setMainPic(renameFile);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		if(itemLabel!=null) {
			String picName=itemLabel.getOriginalFilename();
			String ex=picName.substring(picName.lastIndexOf("."));
			SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*10000)+1;
			String renameFile=sim.format(System.currentTimeMillis())+"_"+rnd+ex;
			try {
				itemLabel.transferTo(new File(path1+renameFile));
				s.setItemLabel(renameFile);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		for(MultipartFile f : imgFile) {
		//리네임 규칙생성
			if(!f.isEmpty()) {
				
				String picName=f.getOriginalFilename();
				String ex=picName.substring(picName.lastIndexOf("."));
				
				SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*10000)+1;
				String renameFile=sim.format(System.currentTimeMillis())+"_"+rnd+ex;
				
				//파일 업로드하기
				try {
					f.transferTo(new File(path+renameFile));
					files.add(ItemPic.builder()
							.picName(renameFile)
							.build());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		s.setIpic(files);

		int result=service.insertItem( s);
		if(result>0) {
			mv.addObject("msg", "상품 등록 완료");
			mv.addObject("loc", "/market1/marketdetail.do?itemNo="+s.getItemNo());
		}else {
			mv.addObject("msg", "상품 등록 실패");
			mv.addObject("loc", "/market1/insertmarket.do");
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/deleteItem.do")
	public String deleteItem(int itemNo,String[] picName,String mainPic,String itemLabel,HttpSession session,Model m){ 
		int result=service.deleteItem(itemNo);

		if(result>0) { 
			m.addAttribute("msg","삭제가 완료되었습니다.");
			m.addAttribute("loc","/market1/marketgtg.do");
			for(int i=0;i<picName.length;i++) {
				String path=session.getServletContext().getRealPath("/resources/upload/market/detail/");
				File del=new File(path+picName[i]);
				if(del.exists()) del.delete();
			}
			String path1=session.getServletContext()
					.getRealPath("/resources/upload/market/mainlabel/");
			File delFile1=new File(path1+mainPic);
			File delFile2=new File(path1+itemLabel);
			if(delFile1.exists()) delFile1.delete();
			if(delFile2.exists()) delFile2.delete();
		}else {
			m.addAttribute("msg","삭제 실패하였습니다.");
			m.addAttribute("loc","/market1/marketdetail.do");
		}
		return "common/msg";
	}
	
	@RequestMapping("/updateItemGo.do")
	public ModelAndView updateItem(int itemNo, ModelAndView mv) {
		SellItem list=service.marketdetail(itemNo);
		mv.addObject("up",list);
		String file="";
		int count=0;
		for(ItemPic i : list.getIpic()) {
			if(count++!=0) file+=",";
			file+=i.getPicName();
		}
		mv.addObject("file",file);
		mv.setViewName("market1/updateItem");
		return mv;
	}
	
	@RequestMapping("/updateMarketItem.do")
	public ModelAndView updateMarketItem(//@RequestParam Map<String,Object> param,
			MultipartFile[] imgFile,MultipartFile mainPic,MultipartFile itemLabel,
		    String mainPic1,String itemLabel1,int itemNo,
		    
			String itemBrand,String itemName,int itemPrice,int delPrice,String madeIn,
			String weight,String mainContent,String itemContent,String itemPoint,
			String itemKeep,String itemTip,String itemCategory,String itemStock,
			ModelAndView mv,HttpSession session,String[] imgFiles) {

		String path=session.getServletContext().getRealPath("/resources/upload/market/detail/");
		String path1=session.getServletContext().getRealPath("/resources/upload/market/mainlabel/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdir();
		List<ItemPic> files=new ArrayList();
		
		SellItem s=SellItem.builder()
				.itemNo(itemNo)
				.itemBrand(itemBrand).itemBrand(itemBrand)
				.itemName(itemName).itemPrice(itemPrice).delPrice(delPrice).madeIn(madeIn)
				.weight(weight)
				.mainContent(mainContent)
				.itemContent(itemContent).itemPoint(itemPoint).itemKeep(itemKeep).itemTip(itemTip)
				.itemCategory(itemCategory).itemStock(itemStock)
				.build();
		
		if(mainPic.getSize()==0) {
//			param.put("mainPic",(String)param.get("mainPic1"));
			s.setMainPic(mainPic1);
		}else {	
			String picName=mainPic.getOriginalFilename();
			String ex=picName.substring(picName.lastIndexOf(".")); 
			SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*10000)+1;
			String renameFile=sim.format(System.currentTimeMillis())+"_"+rnd+ex;
			try {
				File delFile=new File(path1+mainPic1);
				if(delFile.exists()) delFile.delete();
				mainPic.transferTo(new File(path1+renameFile));
//				param.put("mainPic",renameFile);
				s.setMainPic(renameFile);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		if(itemLabel.getSize()!=0) {
			String picName=itemLabel.getOriginalFilename();
			String ex=picName.substring(picName.lastIndexOf("."));
			SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rnd=(int)(Math.random()*10000)+1;
			String renameFile=sim.format(System.currentTimeMillis())+"_"+rnd+ex;
			try {
//				File delFile=new File(path1+(String)param.get("itemLabel1"));
				File delFile=new File(path1+itemLabel1);
				if(delFile.exists()) delFile.delete();
				itemLabel.transferTo(new File(path1+renameFile));
//				param.put("itemLabel",renameFile);
				s.setItemLabel(renameFile);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}else {
//			param.put("itemLabel",(String)param.get("itemLabel1"));
			s.setItemLabel(itemLabel1);
		}
		
		for(MultipartFile f : imgFile) {
			if(!f.isEmpty()) {
				String picName=f.getOriginalFilename();
				String ex=picName.substring(picName.lastIndexOf("."));
				SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*10000)+1;
				String renameFile=sim.format(System.currentTimeMillis())+"_"+rnd+ex;
				try {
					f.transferTo(new File(path+renameFile));
					files.add(ItemPic.builder()
							.picName(renameFile)
							.itemNo(itemNo)
//							.itemNo((int)param.get("itemNo"))
							.build());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(files.isEmpty()) {
			if(imgFiles!=null) {
				for(String arr : imgFiles) {
					files.add(ItemPic.builder()
							.picName(arr)
							.itemNo(itemNo)
							.build());
				}
			}
		}else {
			if(imgFiles!=null) {
				for(int i=0;i<imgFiles.length;i++) {
//					System.out.println(imgFiles[i]);
					File del=new File(path+imgFiles[i]);
					if(del.exists()) del.delete();
				}
			}
		}
		s.setIpic(files);
		
		int result=service.updateMarketItem(s,itemNo);
		if(result>0) {
			mv.addObject("msg", "상품 수정 성공");
			mv.addObject("loc", "/market1/marketdetail.do?itemNo="+itemNo);
		}else {
			mv.addObject("msg", "상품 수정 실패");
			mv.addObject("loc", "/market1/updateItemGo.do");
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	//상품 상세페이지 ajax
	@RequestMapping("/choiceexplain.do")
	public String choiceexplain(int itemNo,String check,Model m,
			@Validated @RequestParam(value="cPage", defaultValue="1", required = true)int cPage,
			@Validated @RequestParam(value="numPerpage", defaultValue="2", required = true)int numPerpage
			) {
		String page="";
		if(check.contains("a")) {
			page="ItemDetailInfo";
			m.addAttribute("de",service.marketdetail(itemNo));
		}else if(check.contains("b")) {
			page="itemReview";
			m.addAttribute("reviews",reservice.selectReviewAll(itemNo));
			m.addAttribute("picpic",reservice.selectrReviewPic());
			
			//페이징처리 다시 시도해보자...
//			List<ItemReview> list=reservice.selectReviewAll(itemNo,Map.of("cPage",cPage,"numPerpage",numPerpage));
//			int totaldata=reservice.selectReviewCount();
//			m.addAttribute("itemNo", itemNo);
//			m.addAttribute("check", "b");
//			m.addAttribute("pageBar",Market1Pagebar.getPage(cPage, numPerpage,totaldata,"choiceexplain.do"));
		
		}else if(check.contains("c")) {
			page="itemExchange";
		}else if(check.contains("d")) {
			page="itemQna";
			m.addAttribute("qna",qnaservice.selectQnaList(itemNo));
			m.addAttribute("an",qnaservice.selectIqAnswer(itemNo));
		}
		m.addAttribute("itemNo", itemNo);
		return "market1/"+page;
		
//		request.setAttribute("itemNo", itemNo);
//		RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/views/market1/"+page);
//		try {
//			dispatcher.forward(request, response);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	
	//카테고리만 ajax처리했었음
//	@RequestMapping("/searchCtg.do")
//	public String searchCtg(String ct,Model m) {
//		String categ="";
//		if(ct.contains("vege")){
//			categ="채소";
//		}else if(ct.contains("fruit")){
//			categ="과일";
//		}else if(ct.contains("sea")){
//			categ="수산";
//		}else if(ct.contains("meat")){
//			categ="정육";
//		}else if(ct.contains("soup")){
//			categ="국";
//		}else if(ct.contains("salad")){
//			categ="샐러드";
//		}else if(ct.contains("noodle")){
//			categ="면";
//		}
//		List<SellItem> list=service.selectCtgAjax(categ);
//		m.addAttribute("ii", list);
//		return "market1/resultGtgselect";
//	}
	
	//선호상품
	@RequestMapping("/memberLikeList.do")
	public ModelAndView memberLikeList(ModelAndView mv,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
	    
		if(loginMember!=null) {
			String memberId=loginMember.getMemberId();
			MarketMemberLike like=service.memberLike(memberId);
			List addlike=new ArrayList();
			String choice="";
			if(like.getFruit().equals("Y")) {
				choice="과일";
				addlike.add(choice);
			}if(like.getSea().equals("Y")) {
				choice="수산";
				addlike.add(choice);
			}if(like.getMeat().equals("Y")) {
				choice="정육";
				addlike.add(choice);
			}if(like.getSide().equals("Y")) {
				choice="반찬";
				addlike.add(choice);
			}if(like.getVege().equals("Y")) {
				choice="채소";
				addlike.add(choice);
			}
			mv.addObject("likectg",addlike);
			
			if(addlike.size()!=0) {
				List<SellItem> likesell=new ArrayList();
				for(int i=0;i<addlike.size();i++) {
					likesell.addAll(service.selectMainLike((String) addlike.get(i)));
				}
				mv.addObject("i",likesell);
			}
		}
		if(loginMember!=null) {
			List<MarketBasket> blist=bservice.selectBasket(loginMember.getMemberId());
			mv.addObject("basket",blist);
		}
		mv.addObject("content","맞춤 추천 상품");
		mv.setViewName("market1/mainChoiceList");
		return mv;
	}
	
	//상품 정렬
	@RequestMapping("/searchItemSort.do")
	public String searchItemSort(Model m,
//			int min, int max,String itemct,String itemsort,
			@RequestParam Map<String,Object> param
			) {
//		Map<String,Object> param=Map.of("min",min,"max",max,"itemct",itemct,"itemsort",itemsort);
		List<SellItem> list=service.searchItemSort(param);
		m.addAttribute("ii", list);
		return "market1/resultGtgselect";
	}
	
	//마감임박 아이템
	@RequestMapping("/soldoutsoon.do")
	public ModelAndView soldoutsoon(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="12")int numPerpage
			,HttpServletRequest request) {
		
		List<SellItem> list=service.soldoutsoon(Map.of("cPage",cPage,"numPerpage",numPerpage));
		mv.addObject("i",list);
		
		int totaldata=service.selectItemCount();
		mv.addObject("pageBar",Market1Pagebar.getPage(cPage, numPerpage,totaldata,"soldoutsoon.do"));
		
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
		if(loginMember!=null) {
			List<MarketBasket> blist=bservice.selectBasket(loginMember.getMemberId());
			mv.addObject("basket",blist);
		}
		mv.addObject("content","마감임박 추천상품");
		mv.setViewName("market1/mainChoiceList");
		return mv;
	}
	
	//1만원대 상품
	@RequestMapping("/recommendman.do")
	public ModelAndView recommendman(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="numPerpage", defaultValue="12")int numPerpage
			,HttpServletRequest request) {
		
		
		List<SellItem> list=service.recommendman(Map.of("cPage",cPage,"numPerpage",numPerpage));
		mv.addObject("i",list);
		
		HttpSession session = request.getSession();
		Member  loginMember= (Member) session.getAttribute("loginMember");
		if(loginMember!=null) {
			List<MarketBasket> blist=bservice.selectBasket(loginMember.getMemberId());
			mv.addObject("basket",blist);
		}
		mv.addObject("content","1만원대 추천상품");
		mv.setViewName("market1/mainChoiceList");
		return mv;
	}
	
	//마켓 카테고리 초기화버튼
	@RequestMapping("/resetSearch.do")
	public String resetSearch(Model m,HttpServletRequest request){
		List<SellItem> list=service.selectItemMarket();
		m.addAttribute("ii",list);
		
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
		if(loginMember!=null) {
			List<MarketBasket> blist=bservice.selectBasket(loginMember.getMemberId());
			m.addAttribute("basket",blist);
		}
		
		
		return "market1/resultGtgselect";
	}
	
	//마켓 헤더 상품 검색
	@RequestMapping("/searchNeed.do")
	public ModelAndView searchNeed(ModelAndView mv, String search,HttpServletRequest request) {
		mv.addObject("i",service.searchNeed(search));
		
		
		HttpSession session = request.getSession();
		Member  loginMember= (Member) session.getAttribute("loginMember");
		if(loginMember!=null) {
			List<MarketBasket> blist=bservice.selectBasket(loginMember.getMemberId());
			mv.addObject("basket",blist);
		}
		mv.addObject("content","상품검색결과");
		mv.setViewName("market1/mainChoiceList");
		return mv;
	}
	
	
}
