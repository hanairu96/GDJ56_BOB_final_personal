package com.today.bab.basket.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.market1.model.vo.MarketBasket;

public interface BasketService {
	int insertbasket(Map<String,Object> param);
	List<MarketBasket> selectBasket(String memberId);
	int updateBasket(Map<String,Object> param);

}
