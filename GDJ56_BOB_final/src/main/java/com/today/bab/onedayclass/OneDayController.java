package com.today.bab.onedayclass;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.member.model.vo.Member;
import com.today.bab.onedayclass.model.service.OneDayService;
import com.today.bab.onedayclass.model.vo.OneDayClass;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class OneDayController {
	
	private OneDayService service;
	
	@Autowired
	public OneDayController(OneDayService service) {
		this.service=service;
	}
	
	@RequestMapping("/class/main.do")
	public ModelAndView oneDayClassMain(ModelAndView mv) {
		
		List<OneDayClass> classlist = service.selectClassList();
		mv.addObject("classlist",classlist);
		mv.setViewName("onedayclass/onedayMain");
		return mv;
	}
	
	@RequestMapping("/class/menu.do")
	public String oneDayClassBob(Model m,String type) {
		
		List<OneDayClass> classlist = service.selectMenuClassList(type);
		m.addAttribute("classlist",classlist);
		return "onedayclass/onedaymenu-"+type;
	}
	
	@RequestMapping("/class/search.do")
	public String selectSearchClass(Model m, String search, String searchlist) {

	   Map<String, Object> param = new HashMap();
	   param.put("type", searchlist);
	   param.put("keyword", search);
	   List<OneDayClass> classlist = service.selectSearchClass(param);
	   m.addAttribute("classlist",classlist);
	   m.addAttribute("param", param);
	   return "onedayclass/onedaySearchResult";
	}
	
	@RequestMapping("/class/masterEnroll.do")
	public String masterEnroll() {
		return "onedayclass/editor";
	}

	@RequestMapping("/class/masterEndEnroll.do")
	public String masterEndEnroll(AdminMaster m, Model model) {
		System.out.println(m);
		int result=service.masterEndEnroll(m);
		
		if(result<0) {
			model.addAttribute("msg","��Ͽ� �����߽��ϴ�");
			model.addAttribute("loc","/class/masterEndEnroll.do");
			return "common/msg";
		}else {
			model.addAttribute("msg","���ν�û ����� �Ϸ�ƽ��ϴ�");
			model.addAttribute("loc","/class/main.do");
			return "common/msg";
		}
	}
	
	@RequestMapping("/class/editor.do")
	public String editor(AdminMaster m) {
		System.out.println(m);
		return "onedayclass/editor";
	}
	
	@RequestMapping("/class/imageUpload.do")
	@ResponseBody
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {

	response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
	  
	 String fileName=upload.getOriginalFilename();
	  

    Date date = new Date();
    SimpleDateFormat imsi = new SimpleDateFormat("yyMMddHHmmssZ");
    fileName = imsi.format(date)+"_"+fileName;
    byte[] bytes = upload.getBytes();
	  

	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/onedayclass/");
    OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));

    outStr.write(bytes);
    
    //String callback=request.getParameter("CKEditorFuncNum");
    PrintWriter out=response.getWriter();
    String fileUrl=request.getContextPath()+"/resources/images/onedayclass/"+fileName;

    //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','�̹����� ���ε�Ǿ����ϴ�.')"+"</script>");
    out.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
    
    out.flush();
    outStr.close();
	}
	
	@RequestMapping("/class/classEnroll.do")
	public String classEnroll(String memberId, Model m) {
		AdminMaster master = service.selectMastserById(memberId);
		m.addAttribute("master", master);
		return "onedayclass/onedayClassEnroll";
	}
	
	@RequestMapping("/class/EndclassEnroll.do")
	public String EndclassEnroll(Model model,HttpServletRequest request, HttpServletResponse response, MultipartFile odcpic,
			String odcClassName, String memberId,String odcCookName, String odcStartDate, String odcEndDate, String odcTime, int odcPeople, String address
			,int odcPrice,String odcContent, String odcEnrollDate, String odcCategoty, String odcStartTime, String mastserName
	) throws Exception{
		
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/onedayclass/");

		//���۵� ������ �ִٸ�...
		//���� ������ ó�� ���� �ϱ�
		String orignalFileName=odcpic.getOriginalFilename();
		String ext=orignalFileName.substring(orignalFileName.lastIndexOf("."));
		//�ߺ����� �ʴ� �̸� �����ϴ� �� �����ϱ�
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd=(int)(Math.random()*10000)+1;
		String renameFile = sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
		
		//���� ���ε��ϱ�
		try {
			//MultipartFile Ŭ������ �������ִ� �޼ҵ� �̿��ؼ� ����ó��
			odcpic.transferTo(new File(uploadPath+renameFile));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("Ŭ�����̸�"+odcClassName);
		System.out.println("�丮�̸�"+odcCookName);
		System.out.println("���۳�¥"+odcStartDate);
		System.out.println("����¥"+odcEndDate);
		System.out.println("Ŭ�������۽ð�"+odcTime);
		System.out.println("�����ο�"+odcPeople);
		
		System.out.println("�ּ�"+address);
		String[] add=address.split(",");
		String odcAdd=address;
		String odcCity=(String)add[1];
		
		System.out.println(odcAdd);
		System.out.println(odcCity);
		
		System.out.println("���۽ð�"+odcStartTime);
		System.out.println("�����"+mastserName);
		System.out.println("�����̸�"+renameFile);
		String odcMainPic=renameFile;
		System.out.println(odcMainPic);
		
		
		
		OneDayClass odc=OneDayClass.builder().odcClassName(odcClassName).odcCookName(odcCookName).odcStartDate(odcStartDate).odcEndDate(odcEndDate).odcTime(odcTime)
		.odcPeople(odcPeople).odcAdd(odcAdd).odcCity(odcCity).odcPrice(odcPrice).odcMainPic(odcMainPic).odcContent(odcContent).odcStartTime(odcStartTime).odcCategoty(odcCategoty)
		.memberId(memberId).build();
		
		System.out.println(odc);
		
		int result=service.endclassEnroll(odc);
		
	
		if(result<0) {
			model.addAttribute("msg","Ŭ���� ��Ͽ� �����߽��ϴ�");
			model.addAttribute("loc","/class/masterEndEnroll.do");
			return "common/msg";
		}else {
			model.addAttribute("msg","Ŭ���� ����� �Ϸ�ƽ��ϴ�");
			model.addAttribute("loc","/class/main.do");
			return "common/msg";
		}
		
	}


}
