package com.today.bab.basket.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.basket.model.vo.Basket;

@Repository
public class BasketDaoImpl implements BasketDao{
	@Override
	public int insertbasket(SqlSessionTemplate session,Basket b) {
		return session.insert("ma.insertBasket",b);
	}
	
	@Override
	public List<Basket> selectBasket(SqlSessionTemplate session,String memberId){
		return session.selectList("ma.selectBasket",memberId);
	}
	
	@Override
	public int updateBasket(SqlSessionTemplate session,Basket b) {
		return session.update("ma.updateBasket",b);
	}
}
