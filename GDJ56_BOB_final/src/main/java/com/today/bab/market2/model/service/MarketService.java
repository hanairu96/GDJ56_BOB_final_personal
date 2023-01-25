package com.today.bab.market2.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.market2.model.vo.SellItem;

public interface MarketService {
	
	List<SellItem> sellItemAll();
	List<SellItem> sellItemAll(Map<String, Integer> page);
	
	
	int discountUpdate(Map<String, Object> param);
	
	List<SellItem> discountItemAll();

}
