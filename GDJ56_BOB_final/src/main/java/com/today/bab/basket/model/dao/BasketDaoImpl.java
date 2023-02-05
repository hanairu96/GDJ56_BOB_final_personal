package com.today.bab.basket.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.basket.model.vo.Basket;

@Repository
public class BasketDaoImpl implements BasketDao{
	@Override
	public int insertbasket(SqlSessionTemplate session,Basket b) {
		return session.insert("ma.insertBasket",b);
	}
}
