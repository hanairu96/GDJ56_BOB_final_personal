package com.today.bab.sub.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.today.bab.sub.model.dao.SubDao;

@Service
public class SubServiceImpl implements SubService {

	private SubDao dao;
	private SqlSessionTemplate session;
	
	public SubServiceImpl(SubDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public int insertSub(Map<String, Object> param) {
		return dao.insertSub(session, param);
	}
	
}
