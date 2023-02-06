package com.today.bab.market2.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TobobDetail;
import com.today.bab.market2.model.vo.TodayBob;

public interface MarketDao {
	
	List<SellItem> sellItemAll(SqlSessionTemplate session, Map<String, Object> param);
	List<SellItem> sellItemByNo(SqlSessionTemplate session, String chItemsTxt);
	
	
																//	List<SellItem> bestItems(SqlSessionTemplate session);
																//	List<SellItem> bestItemsAjax(SqlSessionTemplate session, String value);
	List<SellItem> bestItems(SqlSessionTemplate session,  String value);
	
	
	//.오늘만(할인) 등록
	int discountUpdateBefore(SqlSessionTemplate session, Map<String, Object> param);
	int discountUpdate(SqlSessionTemplate session, Map<String, Object> param);			//./
	
	List<TodayBob> todayBobList(SqlSessionTemplate session);
	int todayBobListCount(SqlSessionTemplate session);
	int deleteTodayBob(SqlSessionTemplate session, int reNo);
																//	int selectTodayBobByTitle(SqlSessionTemplate session, String reTitle);
	int insertTodayBob(SqlSessionTemplate session, TodayBob tb);
	int insertTodayBobItems(SqlSessionTemplate session, Map<String, Object> param); //전체
	int insertTodayBobItem(SqlSessionTemplate session, Map param);	//1개씩
	List<SellItem> todayView(SqlSessionTemplate session, int reNo);
	List<SellItem> todayViewAll(SqlSessionTemplate session);
	

	List<SellItem> discountView(SqlSessionTemplate session);
	int discountCount(SqlSessionTemplate session);
	
	TodayBob todobDetailByreNo(SqlSessionTemplate session, int selectTitleNext);
	
	int deleteModi(SqlSessionTemplate session, int selectTitleNext);
	
	int cart(SqlSessionTemplate session, Basket b);
	
	

}
