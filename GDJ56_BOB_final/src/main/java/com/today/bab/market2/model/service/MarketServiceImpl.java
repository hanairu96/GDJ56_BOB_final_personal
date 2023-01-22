package com.today.bab.market2.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market2.model.dao.MarketDao;
import com.today.bab.market2.model.vo.SellItem;

@Service
public class MarketServiceImpl implements MarketService {
	
	private MarketDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MarketServiceImpl(MarketDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<SellItem> discountItemAll() {
		// TODO Auto-generated method stub
		return dao.discountItemAll(session);
	}
	
	
	
}
