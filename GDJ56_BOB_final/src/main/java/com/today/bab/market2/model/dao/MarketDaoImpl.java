package com.today.bab.market2.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TodayBob;

@Repository
public class MarketDaoImpl implements MarketDao {
	
	@Override
	public List<SellItem> sellItemAll(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectList("market2.sellItemAll", param);
	}
	
	@Override
	public List<SellItem> bestItems(SqlSessionTemplate session) {
		return session.selectList("market2.bestItems");
	}
	
	@Override
	public int discountUpdateBefore(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("market2.discountUpdateBefore", param);
	}
	@Override
	public int discountUpdate(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("market2.discountUpdate", param);
	}
	
	@Override
	public List<TodayBob> todayBobList(SqlSessionTemplate session) {
		return session.selectList("market2.todayBobList");
	}
	@Override
	public int todayBobListCount(SqlSessionTemplate session) {
		return session.selectOne("market2.todayBobListCount");
	}
	
	@Override
	public List<SellItem> discountItemAll(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("market2.discountItemAll");
	}
	
}
