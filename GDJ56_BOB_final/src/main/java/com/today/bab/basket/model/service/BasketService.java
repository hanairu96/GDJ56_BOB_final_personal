package com.today.bab.basket.model.service;

import java.util.List;

import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.MarketBasket;

public interface BasketService {
	int insertbasket(MarketBasket b);
	List<MarketBasket> selectBasket(String memberId);
	int updateBasket(MarketBasket b);

}
