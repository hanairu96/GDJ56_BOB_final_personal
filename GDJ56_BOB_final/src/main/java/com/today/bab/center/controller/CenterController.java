package com.today.bab.center.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.center.model.service.CenterService;
import com.today.bab.center.model.vo.Notice;
import com.today.bab.common.Market2PageBar;

@Controller
@RequestMapping("/center/")
public class CenterController {
	
	private CenterService service;
	
	@Autowired
	public CenterController(CenterService service) {
		this.service = service;
	}
	
	@RequestMapping("/noticeList")
	public ModelAndView noticeList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {
		
		Map<String, Integer> page=Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<Notice> list=service.selectNoticeList(page);
		mv.addObject("list", list);
		
		int totalData=service.selectNoticeCount();
		mv.addObject("pageBar", Market2PageBar.getPage(cPage, numPerpage, totalData, "noticeList"));
		mv.addObject("totalContents", totalData);
		
		mv.setViewName("center/noticeList");
		
		return mv;
	}

	@RequestMapping("/clientQnaList")
	public ModelAndView clientQnaList(ModelAndView mv,
			@RequestParam(value="cPage", defaultValue="1") int cPage,
			@RequestParam(value="numPerpage", defaultValue="5") int numPerpage) {

		Map<String, Integer> page=Map.of("cPage", cPage, "numPerpage", numPerpage);
		List<ClientQNA> list=service.selectCqList(page);
		mv.addObject("list", list);
		
		int totalData=service.selectCqCount();
		mv.addObject("pageBar", Market2PageBar.getPage(cPage, numPerpage, totalData, "clientQnaList"));
		mv.addObject("totalContents", totalData);
		
		mv.setViewName("center/clientQnaList");
		
		return mv;
	}
	
	@RequestMapping("/noticeView")
	public String noticeView(int noticeNo, Model model) {
		
		Notice n=service.selectNotice(noticeNo);
		
		model.addAttribute("n", n);
		
		return "center/noticeView";
	}

	@RequestMapping("/clientQnaView")
	public String clientQnaView(int cqNo, Model model) {
		
		ClientQNA cq=service.selectClientQna(cqNo);
		
		model.addAttribute("cq", cq);
		
		return "center/clientQnaView";
	}
	
	@ResponseBody
	@RequestMapping("/answerEnroll")
	public boolean answerEnroll(@RequestParam(value="args[]") List<String> args) {
		int no=Integer.parseInt(args.get(0));
		String answer=args.get(1);
		Map<String, Object> param=Map.of("no", no, "answer", answer);
		
		int result=service.answerEnroll(param);
		
		boolean data=false;
		if(result>0) {
			data=true;
		}
		return data;
	}

	@ResponseBody
	@RequestMapping("/answerUpdate")
	public boolean answerUpdate(@RequestParam(value="args[]") List<String> args) {
		int no=Integer.parseInt(args.get(0));
		String answer=args.get(1);
		Map<String, Object> param=Map.of("no", no, "answer", answer);
		
		int result=service.answerUpdate(param);
		
		boolean data=false;
		if(result>0) {
			data=true;
		}
		return data;
	}

}
