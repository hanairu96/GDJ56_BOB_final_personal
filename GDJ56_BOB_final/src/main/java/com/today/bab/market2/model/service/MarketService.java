package com.today.bab.market2.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TodayBob;

public interface MarketService {
	
	//모든 상품 조회
	List<SellItem> sellItemAll(Map<String, Object> param);
	
	//베스트 상품 조회
	List<SellItem> bestItems();
	
	//오늘만(할인) 등록
	int discountUpdate(Map<String, Object> param);
	
	//오늘의밥추천(추천) 타이틀 목록 조회
	List<TodayBob> todayBobList();
	int todayBobListCount();
	
	
	
//페이징처리List<SellItem> sellItemAll(Map<String, Integer> page);
	List<SellItem> discountItemAll();

}
