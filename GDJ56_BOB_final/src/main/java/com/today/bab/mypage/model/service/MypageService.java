package com.today.bab.mypage.model.service;

import java.util.List;

import com.today.bab.basket.model.vo.Basket;

public interface MypageService {
	List<Basket> selectBasketById(String userId);
}
