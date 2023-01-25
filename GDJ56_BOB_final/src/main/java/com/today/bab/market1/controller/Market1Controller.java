package com.today.bab.market1.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.market1.model.service.Market1Service;
import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;

@Controller
@RequestMapping("/market1")
public class Market1Controller {
	
	private Market1Service service;

	@Autowired
	public Market1Controller(Market1Service service) {
		super();
		this.service = service;
	}
	
	//헤더에서 마켓 메인 이동 
	@RequestMapping("/matketmain.do")
	public ModelAndView marketmain(ModelAndView mv) {
//		List<SellItem> list=service.selectItemMarket();
//		mv.addObject("items",list);
		mv.setViewName("market1/marketMain");
		return mv;
	}
	//삼품 카테고리로 이동
	@RequestMapping("/marketgtg.do")
	public ModelAndView marketCtg(ModelAndView mv) {
		List<SellItem> list=service.selectItemCtg();
		mv.addObject("i",list);
		mv.setViewName("market1/marketGtg");
		return mv;
	}
	
	@RequestMapping("/marketdetail.do")
	public ModelAndView marketdetail(ModelAndView mv) {
		mv.setViewName("market1/detailMarketItem");
		return mv;
	}
	
	//마켓 상품 등록 페이지 이동
	@RequestMapping("/insertmarket.do")
	public ModelAndView insertgo(ModelAndView mv) {
		mv.setViewName("market1/insertMarketItem");
		return mv;
	}
	
	@RequestMapping("/insertMarketItem.do")
	public ModelAndView insertItem(ModelAndView mv, MultipartFile[] imgFile,
			String itemBrand,String itemName,int itemPrice,int delPrice,String madeIn,
			String weight,MultipartFile mainPic,String mainContent,String itemContent,String itemPoint,
			String itemKeep,String itemTip,MultipartFile itemLabel,String itemCategory,String itemStock
			,HttpSession session) {
		//저장 경로 설정
		String path=session.getServletContext().getRealPath("/resources/upload/matket/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdir();
		List<ItemPic> files=new ArrayList();
		
		for(MultipartFile f : imgFile) {
		//리네임 규칙생성
			if(!f.isEmpty()) {
				String picName=f.getOriginalFilename();
				String ex=picName.substring(picName.lastIndexOf("."));
				//이름 설정
				SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmss");
				int rnd=(int)(Math.random()*10000)+1;
				String renameFile=sim.format(System.currentTimeMillis()+"_"+rnd+ex);
				
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
		SellItem s=SellItem.builder()
				.itemBrand(itemBrand)
				.build();
//			int result=service.insertItem(s);
//			if(result>0) {
//				mv.addObject("msg", "게시판 작성 완료");
//				mv.addObject("loc", "/market1/matketmain.do");
//			}else {
//				mv.addObject("msg", "게시판 작성 실패");
//				mv.addObject("loc", "/market1/insertmarket.do");
//			}
//			mv.setViewName("common/msg");
		return mv;
	}
	
		
		
}
