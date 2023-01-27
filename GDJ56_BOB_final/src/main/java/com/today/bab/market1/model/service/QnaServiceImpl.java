package com.today.bab.market1.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.QnaDao;
import com.today.bab.market1.model.vo.ItemQna;

@Service
public class QnaServiceImpl implements QnaService {
	
	private QnaDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public QnaServiceImpl(QnaDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}

	public 	int insertQna(ItemQna q) {
		return dao.insertQna(session,q);
	}
}
