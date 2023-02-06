package com.today.bab.onedayclass;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.today.bab.common.Market1Pagebar;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.member.model.vo.Member;
import com.today.bab.onedayclass.model.service.OneDayService;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OdcReview;
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
   public ModelAndView oneDayClassMain(ModelAndView mv,
		   @RequestParam(value="cPage", defaultValue="1")int cPage,
		   @RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
      
      List<OneDayClass> classlist = service.selectClassList(Map.of("cPage",cPage,"numPerpage",numPerpage));
      int totaldata=service.countClasslist();
      System.out.println(classlist);
      mv.addObject("pageBar",Market1Pagebar.getPage(cPage, numPerpage,totaldata,"/bab/class/main.do"));
      mv.addObject("classlist",classlist);
      mv.setViewName("onedayclass/onedayMain");
      return mv;
   }
  
   
   @RequestMapping("/class/menu.do")
   public ModelAndView oneDayClassBob(ModelAndView mv,String type) {
      
      List<OneDayClass> classlist = service.selectMenuClassList(type);
      mv.addObject("classlist",classlist);
      mv.setViewName("onedayclass/onedaymenu-"+type);
      return mv;
   }
   
   @RequestMapping("/class/search.do")
   public ModelAndView selectSearchClass(ModelAndView mv, String search, String searchlist) {

      Map<String, Object> param = new HashMap();
      param.put("type", searchlist);
      param.put("keyword", search);
      List<OneDayClass> classlist = service.selectSearchClass(param);
      mv.addObject("classlist",classlist);
      mv.addObject("param", param);
      mv.setViewName("onedayclass/onedaySearchResult");
      return mv;
   }
   
   @RequestMapping("/class/masterEnroll.do")
   public String masterEnroll() {
      return "onedayclass/editor";
   }

   @RequestMapping("/class/masterEndEnroll.do")
   public ModelAndView masterEndEnroll(AdminMaster m, ModelAndView model, String history1) {
      System.out.println(m);
      int result=service.masterEndEnroll(m);
      
      if(result<0) {
         model.addObject("msg","등록에 실패했습니다");
         model.addObject("loc","/class/masterEndEnroll.do");
         model.setViewName("common/msg");
         return model;
      }else {
         model.addObject("msg","장인신청 등록이 완료됐습니다");
         model.addObject("loc","/class/main.do");
         model.setViewName("common/msg");
         return model;
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
      String odcAdd=add[0]+" "+add[2];
      String[] city=add[1].split(" ");
      String odcCity=city[0]+" "+city[1];
      
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
      
      //날짜 포맷해주기
      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
      
  	  //원하는 데이터 포맷 지정
      //String startDate = simpleDateFormat.format(odc.getOdcStartDate()); 
      String endDate = simpleDateFormat.format(odc.getOdcEndDate()); 
  
  	  //지정한 포맷으로 변환 
      //System.out.println("포맷 지정 후 : " + startDate);
      System.out.println("포맷 지정 후 : " + endDate);
      AdminMaster am= service.selectMastserById(odc.getMemberId());
      
      System.out.println(am.getHistory().split(",").length);
      
      String[] h = new String[am.getHistory().split(",").length];
      h=am.getHistory().split(",");
      
      mv.addObject("odc",odc);
      mv.addObject("endDate",endDate);
      mv.addObject("h",h);
      //mv.addObject("startDate", startDate);
      //mv.addObject("endDate", endDate);
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
	   System.out.println(service.selectOdcQaAll(odcNo));
      return service.selectOdcQaAll(odcNo);
      
   }
   
   @RequestMapping("/class/selectReOdcQaAll.do")
   public List<OdcQaRe> selectReOdcQaAll(int oqno){
	   System.out.println(oqno);
	   System.out.println("답글"+service.selectReOdcQaAll(oqno));
	   return service.selectReOdcQaAll(oqno);
	   
   }
   
   @RequestMapping("/class/inputReplayOdcQa.do")
   public void inputReplayOdcQa(@RequestBody OdcQaRe oqr,HttpSession session){
	   System.out.println(oqr);
	   service.inputReplayOdcQa(oqr);
   }
   
   @RequestMapping("/class/pop.do")
   public ModelAndView classEnroll(ModelAndView mv, String id, String no) {
	   
	  //예약한 리스트 가져오기
	  Map<String, Object> param = new HashMap();
      param.put("id", id);
      param.put("no", no);
	  List<OdcReserve> reserveList =service.selectReserve(param);
	  System.out.println("예약한 리스트"+reserveList);
	  
	  //예약날짜 저장
	  String[] arr = new String[reserveList.size()];
	  //예약시퀀스 번호 기준으로의 리뷰리스트
	  List<OdcReview> OdcReviewList=new ArrayList();
	  //리뷰없는 예약시퀀스번호 저장
	  List nums = new ArrayList();
	  
	  //예약한 수업 정보 가져오기
	  //Listservice.odcView(no);	  
	  
	  //예약리스트 존재여부
	  if(!reserveList.isEmpty()) {
		  for(int i=0;i<reserveList.size();i++) {
			  
			  int odcreNo =reserveList.get(i).getOdcreNo();
			  
			 //예약시퀀스번호 기준으로 리뷰 가져오기
			 OdcReviewList=service.selectReview(odcreNo);
			 //리뷰없는 예약시퀀스 번호 저장하기
			 if(OdcReviewList.isEmpty()){
				 nums.add(odcreNo);
			 }
			
			  //한 클래스의 예약한 날짜를 가져오기
			  //DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
			  //Date nowDate = new Date();
			  //nowDate=reserveList.get(i).getOdcDate();
			  //String today = sdFormat.format(nowDate);
			  //arr[i]=today;
			  
		  }
		  System.out.println("리뷰없는 예약시퀀스번호"+nums);
		 //System.out.println("이 클래스의 예약한 횟수:"+arr.length);
		 //System.out.println("이 클래스의 리뷰한 횟수:");
		 
		  //리뷰가 없는 예약 시퀀스 번호의 예약리스트 가져오기
		  List<OdcReserve> reserveList2=new ArrayList();
		  for(int i=0;i<nums.size();i++) {
			  String reserNo = nums.get(i).toString();
			  System.out.println(reserNo);
			  int no2=Integer.parseInt(reserNo);
			  reserveList2.addAll(service.selectNoReviewReserve(no2));
		  }
		  System.out.println("리뷰없는 예약 리스트"+reserveList2);
		  
		  if(nums.size()<1) {
			  mv.addObject("msg","이미 신청한 클래스의 리뷰 작성을 완료하셨습니다.");
		      mv.setViewName("common/close");
		  }else {
			  mv.addObject("reserveList2", reserveList2);
			  mv.setViewName("onedayclass/onedayReviewPop");
		  }
	  }else {
		  mv.addObject("msg","리뷰는 클래스를 수강한 회원만 가능합니다. "
		  		+ "<br>*클래스를 예약하신 분들은 예약한 수업날짜가 현재 날짜 이후일 떼 리뷰쓰기가 가능해집니다.");
	      mv.setViewName("common/close");
	  }
      return mv;
   }
   
   	@RequestMapping("/class/reviewEndEnroll.do")
	public ModelAndView reviewEndEnroll(HttpServletRequest request, HttpServletResponse response, MultipartFile orePic1,OdcReview or
		)throws Exception{
		
   		System.out.println("파일이름"+orePic1);
   		
   		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html;charset=utf-8");
	 	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/onedayclass/");

	 	if(orePic1!=null) {
	 	String orignalFileName=orePic1.getOriginalFilename();
	 	String ext=orignalFileName.substring(orignalFileName.lastIndexOf("."));
	 	//중복되지 않는 이름 설정하는 값 지정하기
	 	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	 	int rnd=(int)(Math.random()*10000)+1;
	 	String renameFile = sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
	 	or.setOrePic(renameFile);
	   
	 	//파일 업로드하기
	 	try {
	 		//MultipartFile 클래스가 제공해주는 메소드 이용해서 저장처리
	 		orePic1.transferTo(new File(uploadPath+renameFile));
	 	}catch(IOException e) {
	 		e.printStackTrace();
	 	}
	 	
	 	}
       
	 	//OdcReview or = new OdcReview();
	 	//or.builder().odcreNo(odcreNo).odcNo(odcNo).oreContent(oreContent).memberId(memberId).oreGood(oreGood).oreSame(oreSame).orePic(renameFile);
	 	
	 	ModelAndView mv = new ModelAndView();
	 	//디비에 전송...
	 	int result = service.insertReview(or);
	 	
	 	if(result>0) {
			  mv.addObject("msg","리뷰 작성 성공:)");
		      mv.setViewName("common/close");
		  }else {
			  mv.addObject("msg", "리뷰 작성 실패 :(");
			  mv.setViewName("common/close");
		  }
   		
		return mv;    
   	}
   	
   	@RequestMapping("/class/selectReview.do")
   	public List<OdcReview> selectReview(int odcNo) {
   		System.out.println("클래스 번호"+odcNo);
   		System.out.println(service.selectReviewByodcNo(odcNo));
   		return service.selectReviewByodcNo(odcNo);
   	}
   	
  	@RequestMapping("/map.do")
   	public ModelAndView map() {
   			ModelAndView mv = new ModelAndView();
   			mv.setViewName("onedayclass/map");
   		return mv;
   	}
  	
  	@RequestMapping("/class/countPerson.do")
  	public int countPerson(String reDate, int odcNo) {
  		System.out.println(odcNo);
  		Map param=new HashMap();
  		param.put("reDate", reDate);
        param.put("odcNo", odcNo);
  		int num=service.countPerson(param);
  		System.out.println("예약한 인원수"+num);
  		return num;
  	}
   	
  	@RequestMapping("/class/inputReservation.do")
  	public ModelAndView inputReservation(ModelAndView mv,String memberId,String odcDate, String odcNo){
//  		 try {
//             SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//             Date odcDate = format.parse(odcDate1);
//             System.out.println(odcDate);
//             or.setOdcDate(odcDate);
//         } catch(Exception e) {
//             e.printStackTrace();
//         }
     
  		
  		Map param=new HashMap();
  		param.put("memberId", memberId);
        param.put("odcNo", odcNo);
        param.put("odcDate", odcDate);
  		
        int result=service.inputReservation(param);

        if(result>0) {
			  mv.addObject("msg","리뷰 작성 성공:)");
		      mv.setViewName("common/close");
		  }else {
			  mv.addObject("msg", "리뷰 작성 실패 :(");
			  mv.setViewName("common/close");
		  }
  		//System.out.println(or);
  		return mv;
  	} 
   	
}