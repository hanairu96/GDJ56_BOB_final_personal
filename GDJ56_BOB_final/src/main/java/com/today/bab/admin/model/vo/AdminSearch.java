package com.today.bab.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class AdminSearch {
	private int cpage; //현재페이지
	private int numPerpage; //한페이지에 보여주는 데이터수
	
	private String type; //검색타입
	private String keyword; //검색키워드
	
	public AdminSearch() {
		this(1,5);
	}

	public AdminSearch(int cpage, int numPerpage) {
		this.cpage=cpage;
		this.numPerpage=numPerpage;
	}
	
	
	
}
