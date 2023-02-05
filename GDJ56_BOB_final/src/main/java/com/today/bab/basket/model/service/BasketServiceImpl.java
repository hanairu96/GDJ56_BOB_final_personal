package com.today.bab.basket.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.basket.model.dao.BasketDao;
import com.today.bab.basket.model.vo.Basket;

@Service
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
	public int insertbasket(Basket b) {
		return dao.insertbasket(session,b);
	}
}
