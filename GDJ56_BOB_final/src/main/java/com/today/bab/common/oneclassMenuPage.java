package com.today.bab.common;

public class oneclassMenuPage {
	public static String getPage(int cPage,int numPerpage, int totalData,String url,String type ) {
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
	
		
		pageBar="<div class='product__pagination'>";
		
		if(pageNo==1) {
			pageBar+="<a href='#'>";
			pageBar+="<i class='fa' style='font-weight:bold;'> &lt; </i>";
			pageBar+="</a>";
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+")'>";
			pageBar+="<i class='fa' style='font-weight:bold;'> &lt; </i>";
			pageBar+="</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<a href='#'>"+pageNo+"</a>";
			}else {
				pageBar+="<a href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<a href='#'>";
			pageBar+="<i class='fa' style='font-weight:bold;'> > </i>";
			pageBar+="</a>";
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo)+")'>";
			pageBar+="<i class='fa' style='font-weight:bold;'> > </i>";
			pageBar+="</a>";
		}
		pageBar+="</div>";
		
		pageBar+="<script>";
		pageBar+="function fn_paging(pageNo){";
		pageBar+="location.assign('"+url+"?cPage='+pageNo+'&type="+type+"');";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}
}
