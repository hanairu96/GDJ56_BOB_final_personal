package com.today.bab.market1.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;
import com.today.bab.market1.model.vo.MarketMemberLike;

public interface ReviewItemDao {
	
	int insertRe(SqlSessionTemplate session,ItemReview r);
	
	int insertReviewPic(SqlSessionTemplate session,ItemrePic pic );
	
	List<ItemReview> selectReviewAll(SqlSessionTemplate session,int itemNo);
//	List<ItemReview> selectReviewAll(SqlSessionTemplate session,int itemNo ,Map<String,Integer> param);
//	int selectReviewCount(SqlSessionTemplate session);

	List<ItemrePic> selectrReviewPic(SqlSessionTemplate session);
	
	int insertPoint(SqlSessionTemplate session,String memberId);
	
	int selectAvg(SqlSessionTemplate session,int itemNo);
	
	List<ItemReview> choiceReviewList(SqlSessionTemplate session,String list);
}
