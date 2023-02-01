package com.today.bab.market1.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.ReviewItemDao;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;

@Service
public class ReviewItemServiceImpl implements ReviewItemService {
	
	private ReviewItemDao dao;
	private SqlSessionTemplate session;
	
	@Override 
	public int insertRe(ItemReview r) {
		int result=dao.insertRe(session,r);
		System.out.println(result);
		
		if(result>0) {
			for(ItemrePic pic:r.getRepic()) {
				pic.setItemreivew(r);
				result+=dao.insertReviewPic(session,pic);
			}
		}		
		return result;
	}

	
	
	
	
	
}
