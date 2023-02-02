package com.today.bab.market1.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;

public interface ReviewItemDao {
	
	int insertRe(SqlSessionTemplate session,ItemReview r);
	
	int insertReviewPic(SqlSessionTemplate session,ItemrePic pic );
	
	List<ItemReview> selectReviewAll(SqlSessionTemplate session,int itemNo ,Map<String,Integer> param);

	List<ItemrePic> selectrReviewPic(SqlSessionTemplate session);
	
	int insertPoint(SqlSessionTemplate session,String memberId);
	
	int selectReviewCount(SqlSessionTemplate session);

}
