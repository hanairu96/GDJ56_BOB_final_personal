package com.today.bab.market2.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TodayBob;

public interface MarketDao {
	
	List<SellItem> sellItemAll(SqlSessionTemplate session, Map<String, Object> param);
	
	List<SellItem> bestItems(SqlSessionTemplate session);
	
	
	//.오늘만(할인) 등록
	int discountUpdateBefore(SqlSessionTemplate session, Map<String, Object> param);
	int discountUpdate(SqlSessionTemplate session, Map<String, Object> param);			//./
	
	List<TodayBob> todayBobList(SqlSessionTemplate session);
	int todayBobListCount(SqlSessionTemplate session);
	
	
	List<SellItem> discountItemAll(SqlSessionTemplate session);

}
