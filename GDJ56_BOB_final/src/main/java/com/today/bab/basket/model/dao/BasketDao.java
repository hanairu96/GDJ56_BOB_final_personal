package com.today.bab.basket.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.basket.model.vo.Basket;

public interface BasketDao {
	int insertbasket(SqlSessionTemplate session,Basket b);
	int updateBasket(SqlSessionTemplate session,Basket b);
	List<Basket> selectBasket(SqlSessionTemplate session,String memberId);
}
