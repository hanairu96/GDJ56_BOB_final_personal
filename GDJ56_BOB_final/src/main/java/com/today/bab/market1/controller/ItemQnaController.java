package com.today.bab.market1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.today.bab.market1.model.service.Market1Service;
import com.today.bab.market1.model.service.QnaService;
import com.today.bab.market1.model.vo.IqAnswer;
import com.today.bab.market1.model.vo.ItemQna;
import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.member.model.vo.Member;

@Controller
@RequestMapping("/itemQna")
public class ItemQnaController {
	private QnaService service;
	private Market1Service ms;

	@Autowired
	public ItemQnaController(QnaService service,Market1Service ms) {
		super();
		this.service = service;
		this.ms=ms;
	}
	
	//상품 문의
	@RequestMapping("/insertQna.do")
	public String insertQna(Model m, ItemQna a,
			String iqContent, String memberId, int itemNo,
			String iqSecret, String iqSecret1) {
		int result=0;
		if(iqSecret==null) {
			ItemQna i=ItemQna.builder()
					.iqContent(iqContent)
					.memberId(memberId)
					.itemNo(itemNo)
					.iqSecret(iqSecret1)
					.build();
			result=service.insertQna(i);
		}else {
			ItemQna i=ItemQna.builder()
					.iqContent(iqContent)
					.memberId(memberId)
					.itemNo(itemNo)
					.iqSecret(iqSecret)
					.build();
			result=service.insertQna(i);
		}
		if(result>0) {
			m.addAttribute("msg", "질문 등록 완료");
			m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
			
			List<ItemQna> qq=service.selectQnaList(itemNo);
			m.addAttribute("qna",qq);
			
		}else {
			m.addAttribute("msg", "질문 등록 실패");
			m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
			
			
			List<ItemQna> qq=service.selectQnaList(itemNo);
			m.addAttribute("qna",qq);
		}
		return "common/msg";
	}
	
	//문의 리스트 출력
	@RequestMapping("/selectQna.do")
	public String selectQna(Model m,int itemNo) {
		//상품 문의 리스트 출력
		List<ItemQna> qq=service.selectQnaList(itemNo);
		//문의 답변
		List<IqAnswer> an=service.selectIqAnswer(itemNo);
		
		m.addAttribute("answer",an);
		m.addAttribute("qna",qq);
		m.addAttribute("itemNo",itemNo);
		return "market1/itemQna";
	}
	
	//문의글 삭제
	@RequestMapping("/delectQna.do")
	public String delectQna(int iqNo,int itemNo,Model m) {
		int result=service.delectQna(iqNo);
		
		if(result>0) {
			m.addAttribute("msg", "질문 삭제 완료");
			m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
			List<ItemQna> qq=service.selectQnaList(itemNo);
			//문의 답변
			List<IqAnswer> an=service.selectIqAnswer(itemNo);
			
			m.addAttribute("answer",an);
			m.addAttribute("qna",qq);
		}else {
			m.addAttribute("msg", "질문 삭제 실패");
			m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
			
			List<ItemQna> qq=service.selectQnaList(itemNo);
			//문의 답변
			List<IqAnswer> an=service.selectIqAnswer(itemNo);
			
			m.addAttribute("answer",an);
			m.addAttribute("qna",qq);
		}
		return "common/msg";
	}
	
	//문의글에 관리자의 답변
	@RequestMapping("/qnaAnswerAdmin.do")
	public String qnaAnswerAdmin(int iqNo,int itemNo,String IqaContent,Model m) {
		
		IqAnswer iq=IqAnswer.builder()
				.iqNo(iqNo)
				.IqaContent(IqaContent)
				.itemNo(itemNo)
				.build();
		int result=service.qnaAnswerAdmin(iq);
		if(result>0) {
			m.addAttribute("msg", "답변 입력 완료");
			m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
			//문의 리스트
			List<ItemQna> qq=service.selectQnaList(itemNo);
			//문의에 대한 답변 리스트
			List<IqAnswer> an=service.selectIqAnswer(itemNo);
			
			m.addAttribute("answer",an);
			m.addAttribute("qna",qq);
			
		}else {
			m.addAttribute("msg", "답변 입력 실패");
			m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
			//문의 리스트
			List<ItemQna> qq=service.selectQnaList(itemNo);
			//문의에 대한 답변 리스트
			List<IqAnswer> an=service.selectIqAnswer(itemNo);
			m.addAttribute("answer",an);
			m.addAttribute("qna",qq);
		}
		return "common/msg";
		
	}
	
	@RequestMapping("/resultresult.do")
		public String resultresult(int itemNo,Model m) {
		//문의 답변
		List<IqAnswer> an=service.selectIqAnswer(itemNo);
		System.out.println(an);
		return "market1/marketMain";
	}
}
