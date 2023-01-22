package com.today.bab.market2.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market2.model.vo.SellItem;

@Repository
public class MarketDaoImpl implements MarketDao {
	
	@Override
	public List<SellItem> discountItemAll(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("market2.discountItemAll");
	}
	
}
