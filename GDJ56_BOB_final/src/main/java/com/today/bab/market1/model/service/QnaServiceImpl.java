package com.today.bab.market1.model.service;

import java.util.List;

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
	
	@Override
	public int insertQna(ItemQna q) {
		return dao.insertQna(session,q);
	}
	
	@Override
	public List<ItemQna> selectQna(int itemNo){
		return dao.selectQna(session,itemNo);
	}
}
