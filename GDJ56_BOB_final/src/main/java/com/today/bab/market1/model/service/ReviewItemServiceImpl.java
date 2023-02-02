package com.today.bab.market1.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.ReviewItemDao;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;

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
	

	
	
	
	
	
}
