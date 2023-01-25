package com.today.bab.market1.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.market1.model.service.Market1Service;
import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/market1")
@Slf4j
public class Market1Controller {
	
	private Market1Service service;

	@Autowired
	public Market1Controller(Market1Service service) {
		super();
		this.service = service;
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
	public ModelAndView marketmain(ModelAndView mv) {
		List<SellItem> list=service.selectItemMarket();
		mv.addObject("items",list);
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
	//상품 상세페이지로 이동
	@RequestMapping("/marketdetail.do")
	public ModelAndView marketdetail(ModelAndView mv,int itemNo) {
		SellItem list=service.marketdetail(itemNo);
		mv.addObject("de",list);
		String file="";
		int count=0;
		for(ItemPic i : list.getIpic()) {
			if(count++!=0) file+=",";
			file+=i.getPicName();
		}
		mv.addObject("picpic",file);
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
			mv.addObject("msg", "게시판 작성 완료");
			mv.addObject("loc", "/market1/matketmain.do");
		}else {
			mv.addObject("msg", "게시판 작성 실패");
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
		
		
}
