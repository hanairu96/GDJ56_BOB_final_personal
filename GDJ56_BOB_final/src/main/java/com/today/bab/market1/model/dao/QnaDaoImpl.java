package com.today.bab.market1.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market1.model.vo.ItemQna;

@Repository
public class QnaDaoImpl implements QnaDao {
	@Override
	public int insertQna(SqlSessionTemplate session, ItemQna q) {
		return session.insert("itemqna.insertQna",q);
	}
}
