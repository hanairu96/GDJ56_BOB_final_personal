package com.today.bab.basket.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.MarketBasket;

@Repository
public class BasketDaoImpl implements BasketDao{
	@Override
	public int insertbasket(SqlSessionTemplate session,Map<String,Object> param) {
		return session.insert("ma.insertBasket",param);
	}
	
	@Override
	public List<MarketBasket> selectBasket(SqlSessionTemplate session,String memberId){
		return session.selectList("ma.selectBasket",memberId);
	}
	
	@Override
	public int updateBasket(SqlSessionTemplate session,Map<String,Object> param) {
		return session.update("ma.updateBasket",param);
	}
}
