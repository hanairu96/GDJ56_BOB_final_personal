package com.today.bab.basket.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.MarketBasket;

public interface BasketDao {
	int insertbasket(SqlSessionTemplate session,MarketBasket b);
	int updateBasket(SqlSessionTemplate session,MarketBasket b);
	List<MarketBasket> selectBasket(SqlSessionTemplate session,String memberId);
}
