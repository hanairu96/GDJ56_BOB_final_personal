package com.today.bab.onedayclass;

import java.io.File;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.common.Market1Pagebar;
import com.today.bab.common.oneclass;
import com.today.bab.common.oneclassMenuPage;
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
      //System.out.println(classlist);
      
      Object member=SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      
      //등록에 실패했습니다
      if(!member.equals("anonymousUser")) {
    	  AdminMaster master=service.selectMastserById(((Member)member).getMemberId());
    	  mv.addObject("master",master);
      }
      
      mv.addObject("pageBar",Market1Pagebar.getPage(cPage, numPerpage,totaldata,"/bab/class/main.do"));
      mv.addObject("classlist",classlist);
      mv.setViewName("onedayclass/onedayMain");
      return mv;
   }
  
   
   @RequestMapping("/class/menu.do")
   public ModelAndView oneDayClassBob(ModelAndView mv,String type,
		  @RequestParam(value="cPage", defaultValue="1")int cPage,
		  @RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {
		  Map<String, Object> param = new HashMap();
	      param.put("type", type);
	      param.put("cPage", cPage);
	      param.put("numPerpage", numPerpage);
	      List<OneDayClass> classlist = service.selectMenuClassList(param);
	      int totaldata=service.countMenuClassList(type);
	      mv.addObject("param", param);
	      mv.addObject("pageBar",oneclassMenuPage.getPage(cPage, numPerpage,totaldata,"/bab//class/menu.do", type));
	      mv.addObject("classlist",classlist);
	      mv.setViewName("onedayclass/onedaymenu-"+type);
	      return mv;
   }
   
   @RequestMapping("/class/search.do")
   public ModelAndView selectSearchClass(ModelAndView mv, String search, String searchlist,
		   @RequestParam(value="cPage", defaultValue="1")int cPage,
		   @RequestParam(value="numPerpage", defaultValue="5")int numPerpage) {

      Map<String, Object> param = new HashMap();
      param.put("type", searchlist);
      param.put("keyword", search);
      param.put("cPage", cPage);
      param.put("numPerpage", numPerpage);
      List<OneDayClass> classlist = service.selectSearchClass(param);
      int totaldata=service.searchCountClasslist(param);
      mv.addObject("classlist",classlist);
      mv.addObject("param", param);
      mv.addObject("pageBar",oneclass.getPage(cPage, numPerpage,totaldata,"/bab/class/search.do", searchlist, search));
      mv.setViewName("onedayclass/onedaySearchResult");
      
      return mv;
   }
   
   @RequestMapping("/class/masterEnroll.do")
   public String masterEnroll() {
      return "onedayclass/editor";
   }

   @RequestMapping("/class/masterEndEnroll.do")
   public ModelAndView masterEndEnroll(AdminMaster m, ModelAndView model, String history1) {
      int result=service.masterEndEnroll(m);
      
      if(result<0) {
         model.addObject("msg","클래스 등록에 실패했습니다");
         model.addObject("loc","/class/masterEndEnroll.do");
         model.setViewName("common/msg");
         return model;
      }else {
         model.addObject("msg","클래스 등록이 완료됐습니다");
         model.addObject("loc","/class/main.do");
         model.setViewName("common/msg");
         return model;
      }
   }
   
 
   @RequestMapping("/class/editor.do")
   public ModelAndView editor(AdminMaster m, ModelAndView mv) {
	  mv.setViewName("onedayclass/editor");
      return mv;
   }
   
   //ckEditor ���� ���ε�� ���������Ű�� �޼ҵ�
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
   public ModelAndView classEnroll(String memberId, ModelAndView mv) {
      AdminMaster master = service.selectMastserById(memberId);
   
      mv.addObject("master",master);
      mv.setViewName("onedayclass/onedayClassEnroll");
      return mv;
      
   }
   
   @RequestMapping("/class/EndclassEnroll.do")
   public String EndclassEnroll(Model model,HttpServletRequest request, HttpServletResponse response, MultipartFile odcpic,
         String odcNo,String odcClassName, String memberId,String odcCookName, String startDate, String endDate, String odcTime, int odcPeople, String address
         ,int odcPrice,String odcContent, String odcEnrollDate, String odcCategoty, String odcStartTime, String mastserName
   ) throws Exception{
      
       
	   SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	   Date odcStartDate = format1.parse(startDate);
	   
	   SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
	   Date odcEndDate = format2.parse(endDate);
      
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
      
      //�ּ� �б�ó��
      String[] add=address.split(",");
      String odcAdd=add[0]+" "+add[2];
      String[] city=add[1].split(" ");
      String odcCity=city[0]+" "+city[1];
      
      //���ϸ�
      String odcMainPic=renameFile;
      
      //�Ѿ�°� ��ü�� ����
      OneDayClass odc=OneDayClass.builder().odcNo(odcNo).odcClassName(odcClassName).odcCookName(odcCookName).odcStartDate(odcStartDate).odcEndDate(odcEndDate).odcTime(odcTime)
      .odcPeople(odcPeople).odcAdd(odcAdd).odcCity(odcCity).odcPrice(odcPrice).odcMainPic(odcMainPic).odcContent(odcContent).odcStartTime(odcStartTime).odcCategoty(odcCategoty)
      .memberId(memberId).build();
      
      //��ü ������ insert
      int result=service.endclassEnroll(odc);
      
      if(result<0) {
         model.addAttribute("msg","장인신청이 완료됐습니다");
         model.addAttribute("loc","/class/masterEndEnroll.do");
         return "common/msg";
      }else {
         model.addAttribute("msg","장인신청 실패!");
         model.addAttribute("loc","/class/main.do");
         return "common/msg";
      }
      
   }
   
   @RequestMapping("/class/odcView.do")
   public ModelAndView odcView(ModelAndView mv, String no) {
	   
      OneDayClass odc = service.odcView(no);
      
      //��¥ �������ֱ�
      SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
      
  	  //���ϴ� ������ ���� ����
      //String startDate = simpleDateFormat.format(odc.getOdcStartDate()); 
      String endDate = simpleDateFormat.format(odc.getOdcEndDate()); 
  
  	  //������ �������� ��ȯ 
      //System.out.println("���� ���� �� : " + startDate);
      AdminMaster am= service.selectMastserById(odc.getMemberId());
      
      
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
      service.inputOdcQa(oq);
   }
   

   
   @RequestMapping("/class/selectOdcQaAll.do")
   public List<OdcQa> selectOdcQaAll(int odcNo){
      return service.selectOdcQaAll(odcNo);
      
   }
   
   @RequestMapping("/class/selectReOdcQaAll.do")
   public List<OdcQaRe> selectReOdcQaAll(int oqno){
	   return service.selectReOdcQaAll(oqno);
	   
   }
   
   @RequestMapping("/class/inputReplayOdcQa.do")
   public void inputReplayOdcQa(@RequestBody OdcQaRe oqr,HttpSession session){
	   service.inputReplayOdcQa(oqr);
   }
   
   @RequestMapping("/class/pop.do")
   public ModelAndView classEnroll(ModelAndView mv, String id, String no) {
	   
	  //������ ����Ʈ ��������
	  Map<String, Object> param = new HashMap();
      param.put("id", id);
      param.put("no", no);
	  List<OdcReserve> reserveList =service.selectReserve(param);
	  
	  //���೯¥ ����
	  String[] arr = new String[reserveList.size()];
	  //��������� ��ȣ ���������� ���丮��Ʈ
	  List<OdcReview> OdcReviewList=new ArrayList();
	  //������� �����������ȣ ����
	  List nums = new ArrayList();
	  
	  //������ ���� ���� ��������
	  //Listservice.odcView(no);	  
	  
	  //���ฮ��Ʈ ���翩��
	  if(!reserveList.isEmpty()) {
		  for(int i=0;i<reserveList.size();i++) {
			  
			  int odcreNo =reserveList.get(i).getOdcreNo();
			  
			 //�����������ȣ �������� ���� ��������
			 OdcReviewList=service.selectReview(odcreNo);
			 //������� ��������� ��ȣ �����ϱ�
			 if(OdcReviewList.isEmpty()){
				 nums.add(odcreNo);
			 }
			
			  //�� Ŭ������ ������ ��¥�� ��������
			  //DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
			  //Date nowDate = new Date();
			  //nowDate=reserveList.get(i).getOdcDate();
			  //String today = sdFormat.format(nowDate);
			  //arr[i]=today;
			  
		  }
		 //System.out.println("�� Ŭ������ ������ Ƚ��:"+arr.length);
		 //System.out.println("�� Ŭ������ ������ Ƚ��:");
		 
		  List<OdcReserve> reserveList2=new ArrayList();
		  for(int i=0;i<nums.size();i++) {
			  String reserNo = nums.get(i).toString();
			  System.out.println(reserNo);
			  int no2=Integer.parseInt(reserNo);
			  reserveList2.addAll(service.selectNoReviewReserve(no2));
		  }
		  
		  if(nums.size()<1) {
			  mv.addObject("msg","후기등록을 모두 완료하셨습니다.");
		      mv.setViewName("common/close");
		  }else {
			  mv.addObject("reserveList2", reserveList2);
			  mv.setViewName("onedayclass/onedayReviewPop");
		  }
	  }else {
		  mv.addObject("msg","후기등록은 수강을 완료한 회원만 등록이 가능합니다.");
	      mv.setViewName("common/close");
	  }
      return mv;
   }
   
   	@RequestMapping("/class/reviewEndEnroll.do")
	public ModelAndView reviewEndEnroll(HttpServletRequest request, HttpServletResponse response, MultipartFile orePic1,OdcReview or
		)throws Exception{
   		
   		response.setCharacterEncoding("utf-8");
   		response.setContentType("text/html;charset=utf-8");
	 	String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/onedayclass/");

	 	if(orePic1!=null) {
	 	String orignalFileName=orePic1.getOriginalFilename();
	 	String ext=orignalFileName.substring(orignalFileName.lastIndexOf("."));
	 	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
	 	int rnd=(int)(Math.random()*10000)+1;
	 	String renameFile = sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
	 	or.setOrePic(renameFile);
	   
	 	//���� ���ε��ϱ�
	 	try {
	 		//MultipartFile Ŭ������ �������ִ� �޼ҵ� �̿��ؼ� ����ó��
	 		orePic1.transferTo(new File(uploadPath+renameFile));
	 	}catch(IOException e) {
	 		e.printStackTrace();
	 	}
	 	
	 	}
       
	 	//OdcReview or = new OdcReview();
	 	//or.builder().odcreNo(odcreNo).odcNo(odcNo).oreContent(oreContent).memberId(memberId).oreGood(oreGood).oreSame(oreSame).orePic(renameFile);
	 	
	 	ModelAndView mv = new ModelAndView();
	 	//��� ����...
	 	int result = service.insertReview(or);
	 	
	 	if(result>0) {
	 		service.insertPoint(or.getMemberId());
			  mv.addObject("msg","리뷰작성 성공:)");
		      mv.setViewName("common/close");
		  }else {
			  mv.addObject("msg", "리뷰작성 실패:(");
			  mv.setViewName("common/close");
		  }
   		
		return mv;    
   	}
   	
   	@RequestMapping("/class/selectReview.do")
   	public List<OdcReview> selectReview(int odcNo) {
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
  		Map param=new HashMap();
  		param.put("reDate", reDate);
        param.put("odcNo", odcNo);
  		int num=service.countPerson(param);
  		return num;
  	}
   	
  	@RequestMapping("/class/inputReservation.do")
  	public void inputReservation(ModelAndView mv,String memberId,String odcDate, String odcNo){
//  		 try {
//             SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//             Date odcDate = format.parse(odcDate1);
//             System.out.println(odcDate);
//             or.setOdcDate(odcDate);
//         } catch(Exception e) {
//             e.printStackTrace();
//         }
  		
  		System.out.println(memberId);
  		
  		Map param=new HashMap();
  		param.put("memberId", memberId);
        param.put("odcNo", odcNo);
        param.put("odcDate", odcDate);
  		
        int result=service.inputReservation(param);
  		
  	} 
  	
  	@RequestMapping("/class/editClass.do")
  	public ModelAndView editClass(String no, ModelAndView mv) {
		OneDayClass odc=service.odcView(no);
			 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		
		String startDate = simpleDateFormat.format(odc.getOdcStartDate()); 
	  	String endDate = simpleDateFormat.format(odc.getOdcEndDate()); 
		 
	  	mv.addObject("startDate",startDate);
	  	mv.addObject("endDate",endDate);
		mv.addObject("odc",odc);
		mv.setViewName("onedayclass/onedayEditClass");
		return mv;
  	}
  	
  	@RequestMapping("/class/selectReviewById.do")
  	public List<OdcReview> selectReviewById(@RequestBody OdcReview or,HttpSession session){
  		
  		Map param=new HashMap();
  		param.put("odcNo", or.getOdcNo());
        param.put("memberId", or.getMemberId());

  		return service.selectReviewById(or);
  	}
  	
  	@RequestMapping("/class/selectQnaById.do")
  	public List<OdcQa> selectQnaById(@RequestBody OdcQa oq,HttpSession session){
  		
  		Map param=new HashMap();
  		param.put("odcNo", oq.getOdcNo());
  		param.put("memberId", oq.getMemberId());
  		
  		return service.selectQnaById(oq);
  	}
  	
  	@RequestMapping("/class/selectNoQna.do")
  	public List<OdcQa> selectNoQna(String odcNo){
  		int no=Integer.valueOf(odcNo);
  		return service.selectNoQna(no);
  	}
  	
  	@RequestMapping("/class/goModifyReview.do")
  	public ModelAndView goModifyReview(int no, ModelAndView mv) {
  		//리뷰 불러오기
  		OdcReview odRe=service.selectReviewByodreNo(no);
  		//예약정보 불러오기
  		OdcReserve odVe=service.selectReservebyodreNo(no);
  		
  		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		String odcDate = simpleDateFormat.format(odVe.getOdcDate()); 
  		
		mv.addObject("odcDate",odcDate);
  		mv.addObject("odRe", odRe);
  		mv.addObject("odVe", odVe);
  		mv.setViewName("onedayclass/onedayModifyReview");
  		return mv;
  	}
  	
  	@RequestMapping("/class/deleteOdcQa.do")
  	public void deleteOdcQa(String oqno) {
  		service.deleteOdcQa(oqno);
  	}
  	
  	@RequestMapping("/class/deleteReOdcQa.do")
  	public void deleteReOdcQa(String oqrNo) {
  		service.deleteReOdcQa(oqrNo);
  	}
  	
  	
  	
  	
  	
   	
}