package com.today.bab.mypage.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.basket.model.vo.Basket;
import com.today.bab.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	
	private MypageDao mypageDao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MypageServiceImpl(MypageDao mypageDao,SqlSessionTemplate session) {
		this.mypageDao=mypageDao;
		this.session=session;
	}
	
	@Override
	public List<Basket> selectBasketById(String userId) {
		return mypageDao.selectBasketById(session,userId);
	}
	
	@Override
	public int updateBasketCount(Basket b) {
		return mypageDao.updateBasketCount(session,b);
	}
	
	@Override
	public int deleteBasketCount(int dbasketNo) {
		return mypageDao.deleteBasketCount(session,dbasketNo);
	}
}
