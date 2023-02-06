package com.today.bab.market1.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.ReviewItemDao;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;
import com.today.bab.market1.model.vo.MarketMemberLike;

@Service
public class ReviewItemServiceImpl implements ReviewItemService {
	
	private ReviewItemDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public ReviewItemServiceImpl(ReviewItemDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	@Override 
	public int insertRe(ItemReview r) {
		int result=dao.insertRe(session,r);
		
		if(result>0) {
			result+=dao.insertPoint(session, r.getMemberId());
					
			for(ItemrePic pic:r.getItemrepic()) {
				pic.setItemreivew(r);
				result+=dao.insertReviewPic(session,pic);
			}
		}		
		return result;
	}

	@Override
	public List<ItemReview> selectReviewAll(int itemNo){
		return dao.selectReviewAll(session,itemNo);
	}
	
//	@Override
//	public List<ItemReview> selectReviewAll(int itemNo,Map<String,Integer> param){
//		return dao.selectReviewAll(session,itemNo,param);
//	}
//	@Override
//	public int selectReviewCount() {
//		return dao.selectReviewCount(session);
//	}
	
	@Override
	public List<ItemrePic> selectrReviewPic(){
		return dao.selectrReviewPic(session);
	}
	
	@Override
	public int selectAvg(int itemNo) {
		return dao.selectAvg(session,itemNo);
	}

	@Override
	public List<ItemReview> choiceReviewList(String list){
		return dao.choiceReviewList(session,list);
	}
	
	
}
