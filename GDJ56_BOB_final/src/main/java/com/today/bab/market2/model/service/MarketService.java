package com.today.bab.market2.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TodayBob;

public interface MarketService {
	
	//모든 상품 조회
	List<SellItem> sellItemAll(Map<String, Object> param);
	List<SellItem> sellItemByNo(String chItemsTxt);
	
	//베스트 상품 조회
												//	List<SellItem> bestItems();
												//	List<SellItem> bestItemsAjax(String value); ↓하나로 합침
	List<SellItem> bestItems(String value);
	
	//오늘만(할인) 등록
	int discountUpdate(Map<String, Object> param);
	
	//오늘의밥추천(추천) 타이틀 목록 조회
	List<TodayBob> todayBobList();
	int todayBobListCount();
	
//	//오늘의밥추천(추천) 타이틀 삭제
	int deleteTodayBob(int reNo);
	
	//오늘의밥추천(추천) 타이틀 생성
												//	int insertTodayBob(TodayBob tb); //-->상품넣는것도 동시에해보는중int insertTodayBob(TodayBob tb);Map<String, Object> param
												//	//타이틀 제목으로 생성된 seq번호 구하기
												//	int selectTodayBobByTitle(String reTitle); ↓하나로 합침
	int insertTodayBobItems(Map<String, Object> param);
	
	List<SellItem> todayView(int reNo);
	
	
	
//페이징처리List<SellItem> sellItemAll(Map<String, Integer> page);

}
