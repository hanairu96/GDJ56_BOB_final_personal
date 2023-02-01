package com.today.bab.center.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.today.bab.center.model.dao.CenterDao;

@Service
public class CenterServiceImpl implements CenterService {
	
	private CenterDao dao;
	private SqlSessionTemplate session;

	public CenterServiceImpl(CenterDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}
	
	
}
