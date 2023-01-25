package com.today.bab.market1.model.service;

import java.util.List;

import com.today.bab.market2.model.vo.SellItem;

public interface Market1Service {
	
	//카테고리 상품 조회
	List<SellItem> selectItemCtg();

	//상품 상세조회
	SellItem marketdetail(int itemNo);

	//상품 등록
	int insertItem(SellItem s);



}
