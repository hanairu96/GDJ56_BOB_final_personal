package com.today.bab.common;

public class Market2PageBar {
	
	public static String getPage(int cPage, int numPerpage, int totalData, String url) {
		//pagebar를 만들어서 반환해주는 기능을 하는 메소드
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		pageBar="<div class='pagination flex-l-m flex-w m-l--6 p-t-25'>";
		
		if(pageNo==1) {
			pageBar+="<a href='#' class='item-pagination flex-c-m trans-0-4' onclick='fn_pageBtn(event)'>prev</a>";
		}else {
			pageBar+="<a class='item-pagination flex-c-m trans-0-4' onclick='fn_pageBtn(event)' href='javascript:fn_paging("+(pageNo-1)+")'>prev</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<a href='#' class='item-pagination flex-c-m trans-0-4' onclick='fn_pageBtn(event)'>"+pageNo+"</a>";
			}else {
				pageBar+="<a class='item-pagination flex-c-m trans-0-4' onclick='fn_pageBtn(event)' href='javascript:fn_paging("+(pageNo)+")'>"
							+pageNo+"</a>";
			}
			
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<a href='#' class='item-pagination flex-c-m trans-0-4' onclick='fn_pageBtn(event)'>next</a>";
		}else {
			pageBar+="<a class='item-pagination flex-c-m trans-0-4' onclick='fn_pageBtn(event)' href='javascript:fn_paging("+(pageNo)+")'>next</a>";
		}
		
		
		pageBar+="<script>";
		pageBar+="function fn_paging(pageNo){";
		pageBar+="location.assign('"+url+"?cPage='+pageNo);";
		pageBar+="}";
		pageBar+="</script>";
		
		
		
		return pageBar;
	}

}
