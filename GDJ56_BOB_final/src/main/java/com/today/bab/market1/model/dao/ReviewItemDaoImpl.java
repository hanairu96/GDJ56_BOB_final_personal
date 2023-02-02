package com.today.bab.market1.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;

@Repository
public class ReviewItemDaoImpl implements ReviewItemDao {

	@Override
	public int insertRe(SqlSessionTemplate session,ItemReview r) {
		return session.insert("ireview.insertRe",r);
	}
	
	@Override 
	public int insertReviewPic(SqlSessionTemplate session,ItemrePic pic ) {
		return session.insert("ireview.insertReviewPic",pic);
	}
	
	
	@Override
	public List<ItemReview> selectReviewAll(SqlSessionTemplate session,int itemNo){
		return session.selectList("ireview.selectReviewAll",itemNo);
	}
}
