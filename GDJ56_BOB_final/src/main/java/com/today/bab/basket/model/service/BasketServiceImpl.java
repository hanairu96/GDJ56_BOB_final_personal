package com.today.bab.basket.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.basket.model.dao.BasketDao;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.MarketBasket;

@Service("com.today.bab.basket.model.service.BasketServiceImpl")
public class BasketServiceImpl implements BasketService {
	private BasketDao dao;
	private SqlSessionTemplate session;
	@Autowired
	
	public BasketServiceImpl(BasketDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public int insertbasket(Map<String,Object> param) {
		return dao.insertbasket(session,param);
	}
	
	@Override
	public List<MarketBasket> selectBasket(String memberId){
		return dao.selectBasket(session, memberId);
	}
	
	@Override
	public int updateBasket(Map<String,Object> param) {
		return dao.updateBasket(session,param);
	}
}
