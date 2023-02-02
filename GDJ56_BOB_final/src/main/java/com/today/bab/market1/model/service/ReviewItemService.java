package com.today.bab.market1.model.service;

import java.util.List;

import com.today.bab.market1.model.vo.ItemReview;

public interface ReviewItemService {
	
	int insertRe(ItemReview r);
	
	List<ItemReview> selectReviewAll(int itemNo);
}
