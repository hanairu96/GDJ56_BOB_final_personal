package com.today.bab.market1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		m.addAttribute("msg", result>0?"질문 등록 완료":"질문 등록 실패");
		m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
		return "common/msg";
	}
	//문의글 삭제
	@RequestMapping("/delectQna.do")
	public String delectQna(int iqNo,int itemNo,Model m) {
		int result=service.delectQna(iqNo);
		
		m.addAttribute("msg", result>0?"질문 삭제 완료":"질문 삭제 실패");
		m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
		return "common/msg";
	}
	
	//문의글에 관리자의 답변
	//@ResponseBody(value="/qnaAnswerAdmin.do",produces="application/text; charset=UTF-8"
	//		,method=RequestMethod.POST)
	//@ResponseBody

	@RequestMapping("/qnaAnswerAdmin.do")
	public String qnaAnswerAdmin(int iqNo,int itemNo,String iqaContent,Model m) {
		
		IqAnswer iq=IqAnswer.builder()
				.iqNo(iqNo)
				.iqaContent(iqaContent)
				.itemNo(itemNo)
				.build();
		
		int result=service.qnaAnswerAdmin(iq);
		
		m.addAttribute("msg",result>0?"답변 입력 완료":"답변 입력 실패");
		m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
		return "common/msg";
	}
		
	
	//문의 답글 삭제
	@RequestMapping("/deleteAnswer.do")
	public String deleteQnaAnswer(int iqaNo,int itemNo,Model m) {
		int result=service.deleteQnaAnswer(iqaNo);
		
		m.addAttribute("msg", result>0?"답글 삭제 완료":"답글 삭제 실패");
		m.addAttribute("loc", "/market1/marketdetail.do?itemNo="+itemNo);
		return "common/msg";
	}
	
	
	
	
//////////나중에 삭제하기	
	//테스트 서블릿
	@RequestMapping("/resultresult.do")
		public String resultresult(int itemNo,Model m) {
		List<ItemQna> qq=service.selectQnaList(itemNo);
		//문의 답변
		List<IqAnswer> an=service.selectIqAnswer(itemNo);
		
		m.addAttribute("an",an);
		m.addAttribute("qna",qq);
		return "market1/itemQna";
	}
	
}
