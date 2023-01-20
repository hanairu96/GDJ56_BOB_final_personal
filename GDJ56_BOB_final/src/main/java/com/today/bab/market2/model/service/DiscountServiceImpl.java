package com.today.bab.market2.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market2.model.dao.DiscountDao;
import com.today.bab.market2.model.vo.SellItem;

@Service
public class DiscountServiceImpl implements DiscountService {
	
	private DiscountDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public DiscountServiceImpl(DiscountDao dao, SqlSessionTemplate session) {
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
