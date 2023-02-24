package com.today.bab.common;

public class AjaxPageBar {
	
	public static String getPage(int cPage, int numPerpage, int totalData, String url) {
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=3;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar="<div class='product__pagination'>";
		
		pageBar+="<a><i class='fa' style='font-weight:bold;'>&lt;";
		pageBar+="</i></a>";
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			pageBar+="<a>";
			pageBar+=pageNo;
			pageBar+="</a>";
			pageNo++;
		}
		
		pageBar+="<a><i class='fa' style='font-weight:bold;'>>";
		pageBar+="</i></a>";
		
		pageBar+="</div>";
		
		return pageBar;
	}

}
