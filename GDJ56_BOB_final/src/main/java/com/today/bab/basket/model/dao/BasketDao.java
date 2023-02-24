package com.today.bab.basket.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.MarketBasket;

public interface BasketDao {
	int insertbasket(SqlSessionTemplate session,Map<String,Object> param);
	int updateBasket(SqlSessionTemplate session,Map<String,Object> param);
	List<MarketBasket> selectBasket(SqlSessionTemplate session,String memberId);
}
