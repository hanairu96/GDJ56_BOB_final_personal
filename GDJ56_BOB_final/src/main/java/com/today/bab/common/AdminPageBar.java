package com.today.bab.common;

public class AdminPageBar {

	  public static String getPage(int cPage, int numPerpage, int totalData, String url) {
	         //pagebar를 만들어서 반환해주는 기능을 하는 메소드
		  String pageBar="";
	         int totalPage=(int)Math.ceil((double)totalData/numPerpage);
	         int pageBarSize=3;
	         int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	         int pageEnd=pageNo+pageBarSize-1;
	         
	         
	         pageBar="<ul class='inline-flex items-center'>";
	         
	         if(pageNo==1) {
	            pageBar+="<li class='page-item disabled'>";
	            pageBar+="</li>";
	         }else {
	            pageBar+="<li class='page-item'>";
	            pageBar+="<button class='px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple' onclick='fn_paging("+(pageNo-1)+")'><</button>";
	            pageBar+="</li>";
	         }
	         
	         while(!(pageNo>pageEnd||pageNo>totalPage)) {
	            if(cPage==pageNo) {
	               pageBar+="<li class='page-item disabled'>";
	               pageBar+="<button class='px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple'>"+pageNo+"</button>";
	               pageBar+="</li>";
	            }else {
	               pageBar+="<li class='page-item'>";
	               pageBar+="<button class='px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple' onclick='fn_paging("+(pageNo)+")'>"
	               +pageNo+"</button>";
	               pageBar+="</li>";
	            }
	            
	            pageNo++;
	         }
	         
	         if(pageNo>totalPage) {
	            pageBar+="<li class='page-item disabled'>";
	            pageBar+="</li>";
	         }else {
	            pageBar+="<li class='page-item'>";
	            pageBar+="<button class='px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple' onclick='fn_paging("+(pageNo)+")'>></button>";
	            pageBar+="</li>";
	         }
	         
	         pageBar+="</ul>";
	         
	         pageBar+="<script>";
	         pageBar+="function fn_paging(pageNo){";
	         pageBar+="location.assign('"+url+"?cPage='+pageNo);";
	         pageBar+="}";
	         pageBar+="</script>";
	         
	         
	         return pageBar;
	      }
}
