package com.today.bab.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.basket.model.vo.Basket;

public interface MypageDao {
	List<Basket> selectBasketById(SqlSessionTemplate session,String userId);
	
	int updateBasketCount(SqlSessionTemplate session,Basket b);
	
	int deleteBasketCount(SqlSessionTemplate session,int dbasketNo);
}
