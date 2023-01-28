package com.today.bab.market2.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market2.model.dao.MarketDao;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TodayBob;

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
	public List<SellItem> sellItemAll(Map<String, Object> param) {
		return dao.sellItemAll(session, param);
	}
	
	@Override
	public List<SellItem> bestItems() {
		return dao.bestItems(session);
	}
	
	@Override
	public int discountUpdate(Map<String, Object> param) {
		int result = dao.discountUpdateBefore(session, param);
		if(result>0) {// ! update된 개수도 세야함
			dao.discountUpdate(session, param);
		}
		return dao.discountUpdate(session, param);
	}
	
	@Override
	public List<TodayBob> todayBobList() {
		return dao.todayBobList(session);
	}
	
	@Override
	public int todayBobListCount() {
		return dao.todayBobListCount(session);
	}
	
	@Override
	public List<SellItem> discountItemAll() {
		return dao.discountItemAll(session);
	}
	
	
	
}
