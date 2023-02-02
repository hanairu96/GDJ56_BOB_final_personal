package com.today.bab.market1.model.service;

import java.util.List;

import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;

public interface ReviewItemService {
	
	int insertRe(ItemReview r);
	
	List<ItemReview> selectReviewAll(int itemNo);
	
	List<ItemrePic> selectrReviewPic();
}
