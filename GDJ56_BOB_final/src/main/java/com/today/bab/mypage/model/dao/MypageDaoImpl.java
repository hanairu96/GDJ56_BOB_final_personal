package com.today.bab.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.basket.model.vo.Basket;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Override
	public List<Basket> selectBasketById(SqlSessionTemplate session, String userId) {
		return session.selectList("mypage.selectBasketById",userId);
	}
	
	@Override
	public int updateBasketCount(SqlSessionTemplate session, Basket b) {
		return session.update("mypage.updateBasketCount",b);
	}
	
	@Override
	public int deleteBasketCount(SqlSessionTemplate session, int dbasketNo) {
		return session.delete("mypage.deleteBasketCount",dbasketNo);
	}
}
