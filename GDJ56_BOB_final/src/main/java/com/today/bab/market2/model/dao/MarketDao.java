package com.today.bab.market2.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market2.model.vo.SellItem;

public interface MarketDao {
	
	List<SellItem> sellItemAll(SqlSessionTemplate session);
	
	int discountUpdateBefore(SqlSessionTemplate session, Map<String, Object> param);
	int discountUpdate(SqlSessionTemplate session, Map<String, Object> param);
	
	List<SellItem> discountItemAll(SqlSessionTemplate session);

}
