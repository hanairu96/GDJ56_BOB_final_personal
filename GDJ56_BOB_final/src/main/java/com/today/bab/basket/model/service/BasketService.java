package com.today.bab.basket.model.service;

import java.util.List;

import com.today.bab.basket.model.vo.Basket;

public interface BasketService {
	int insertbasket(Basket b);
	List<Basket> selectBasket(String memberId);
	int updateBasket(Basket b);

}
