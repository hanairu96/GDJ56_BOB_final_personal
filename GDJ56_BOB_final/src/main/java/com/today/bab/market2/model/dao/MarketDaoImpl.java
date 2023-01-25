package com.today.bab.market2.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market2.model.vo.SellItem;

@Repository
public class MarketDaoImpl implements MarketDao {
	
	@Override
	public List<SellItem> sellItemAll(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("market2.sellItemAll");
	}
	
	@Override
	public int discountUpdateBefore(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("market2.discountUpdateBefore", param);
	}
	@Override
	public int discountUpdate(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("market2.discountUpdate", param);
	}
	
	@Override
	public List<SellItem> discountItemAll(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("market2.discountItemAll");
	}
	
}
