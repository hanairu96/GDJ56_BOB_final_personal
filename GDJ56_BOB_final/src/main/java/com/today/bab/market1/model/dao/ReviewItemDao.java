package com.today.bab.market1.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;

public interface ReviewItemDao {
	
	int insertRe(SqlSessionTemplate session,ItemReview r);
	
	int insertReviewPic(SqlSessionTemplate session,ItemrePic pic );
	
	List<ItemReview> selectReviewAll(SqlSessionTemplate session,int itemNo);
}
