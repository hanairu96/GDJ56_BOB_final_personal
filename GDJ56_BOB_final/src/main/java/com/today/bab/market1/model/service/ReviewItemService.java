package com.today.bab.market1.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;
import com.today.bab.market1.model.vo.MarketMemberLike;

public interface ReviewItemService {
	
	int insertRe(ItemReview r);
	
	List<ItemReview> selectReviewAll(int itemNo);
//	List<ItemReview> selectReviewAll(int itemNo,Map<String,Integer> param);
//	int selectReviewCount();

	List<ItemrePic> selectrReviewPic();
	
	int selectAvg(int itemNo);

}
