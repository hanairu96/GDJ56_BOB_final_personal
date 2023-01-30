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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OneDayClass;

import lombok.extern.slf4j.Slf4j;

@ResponseBody
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
         model.addAttribute("msg","등록에 실패했습니다");
         model.addAttribute("loc","/class/masterEndEnroll.do");
         return "common/msg";
      }else {
         model.addAttribute("msg","장인신청 등록이 완료됐습니다");
         model.addAttribute("loc","/class/main.do");
         return "common/msg";
      }
   }
   
   //장인신청 페이지로 넘어가는 메소드
   @RequestMapping("/class/editor.do")
   public ModelAndView editor(AdminMaster m, ModelAndView mv) {
	  mv.setViewName("onedayclass/editor");
      return mv;
   }
   
   //ckEditor 사진 업로드시 파일저장시키는 메소드
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
   
       //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
       out.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
       
       out.flush();
       outStr.close();
   }
   
   @RequestMapping("/class/classEnroll.do")
   public ModelAndView classEnroll(String memberId, ModelAndView mv) {
      AdminMaster master = service.selectMastserById(memberId);
   
      mv.addObject("master",master);
      mv.setViewName("onedayclass/onedayClassEnroll");
      return mv;
 
      
   }
   
   @RequestMapping("/class/EndclassEnroll.do")
   public String EndclassEnroll(Model model,HttpServletRequest request, HttpServletResponse response, MultipartFile odcpic,
         String odcClassName, String memberId,String odcCookName, String startDate, String endDate, String odcTime, int odcPeople, String address
         ,int odcPrice,String odcContent, String odcEnrollDate, String odcCategoty, String odcStartTime, String mastserName
   ) throws Exception{
      
      System.out.println(startDate);
      System.out.println(endDate);
       
	   SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	   Date odcStartDate = format1.parse(startDate);
	   System.out.println(odcStartDate);
	   
	   SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
	   Date odcEndDate = format2.parse(endDate);
	   System.out.println(odcEndDate);
      
      response.setCharacterEncoding("utf-8");
       response.setContentType("text/html;charset=utf-8");
       String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/onedayclass/");

      //전송된 파일이 있다면...
      //파일 리네임 처리 직접 하기
      String orignalFileName=odcpic.getOriginalFilename();
      String ext=orignalFileName.substring(orignalFileName.lastIndexOf("."));
      //중복되지 않는 이름 설정하는 값 지정하기
      SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
      int rnd=(int)(Math.random()*10000)+1;
      String renameFile = sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
      
      //파일 업로드하기
      try {
         //MultipartFile 클래스가 제공해주는 메소드 이용해서 저장처리
         odcpic.transferTo(new File(uploadPath+renameFile));
      }catch(IOException e) {
         e.printStackTrace();
      }
      
      //주소 분기처리
      String[] add=address.split(",");
      String odcAdd=address;
      String odcCity=(String)add[1];
      
      //파일명
      String odcMainPic=renameFile;
      
      //넘어온값 객체에 빌드
      OneDayClass odc=OneDayClass.builder().odcClassName(odcClassName).odcCookName(odcCookName).odcStartDate(odcStartDate).odcEndDate(odcEndDate).odcTime(odcTime)
      .odcPeople(odcPeople).odcAdd(odcAdd).odcCity(odcCity).odcPrice(odcPrice).odcMainPic(odcMainPic).odcContent(odcContent).odcStartTime(odcStartTime).odcCategoty(odcCategoty)
      .memberId(memberId).build();
      
      //객체 보내서 insert
      int result=service.endclassEnroll(odc);
      
      if(result<0) {
         model.addAttribute("msg","클래스 등록에 실패했습니다");
         model.addAttribute("loc","/class/masterEndEnroll.do");
         return "common/msg";
      }else {
         model.addAttribute("msg","클래스 등록이 완료됐습니다");
         model.addAttribute("loc","/class/main.do");
         return "common/msg";
      }
      
   }
   
   @RequestMapping("/class/odcView.do")
   public ModelAndView odcView(ModelAndView mv, String no) {
      
      OneDayClass odc = service.odcView(no);
      AdminMaster am= service.selectMastserById(odc.getMemberId());
      mv.addObject("odc",odc);
      mv.addObject("am",am);
      mv.setViewName("onedayclass/onedayClassDetail");
      return mv;
   }
   
   @RequestMapping("/class/inputOdcQa.do")
   public void inputOdcQa(@RequestBody OdcQa oq, HttpSession session) {
      //System.out.println(oqContent);
      //System.out.println(oqSecretYn);
      //System.out.println(odcNo);
      //System.out.println(memberId);
      //OdcQa oq=OdcQa.builder().oqContent(oqContent).oqSecretYn(oqSecretYn).odcNo(odcNo).memberId(memberId).build();
      System.out.println(oq);
      service.inputOdcQa(oq);
   }
   

   
   @RequestMapping("/class/selectOdcQaAll.do")
   public List<OdcQa> selectOdcQaAll(int odcNo){
      return service.selectOdcQaAll(odcNo);
      
   }
   


}