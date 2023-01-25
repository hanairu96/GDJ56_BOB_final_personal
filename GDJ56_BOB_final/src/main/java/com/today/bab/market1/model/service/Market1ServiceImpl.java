package com.today.bab.market1.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.Market1Dao;
import com.today.bab.market2.model.vo.SellItem;


@Service
public class Market1ServiceImpl implements Market1Service{

	private Market1Dao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public Market1ServiceImpl(Market1Dao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	public List<SellItem> selectItemCtg(){
		return dao.selectItemCtg(session);
	}
	
	
}
