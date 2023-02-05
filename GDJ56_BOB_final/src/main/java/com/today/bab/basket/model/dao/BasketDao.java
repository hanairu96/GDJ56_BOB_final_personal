package com.today.bab.basket.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.basket.model.vo.Basket;

public interface BasketDao {
	int insertbasket(SqlSessionTemplate session,Basket b);
}
