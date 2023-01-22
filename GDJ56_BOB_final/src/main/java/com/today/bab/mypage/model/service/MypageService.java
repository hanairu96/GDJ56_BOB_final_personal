package com.today.bab.mypage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.basket.model.vo.Basket;

public interface MypageService {
	List<Basket> selectBasketById(String userId);
	
	int updateBasketCount(Basket b);
	
	int deleteBasketCount(int dbasketNo);
}
