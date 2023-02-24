package com.today.bab.sub.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SubDaoImpl implements SubDao {

	@Override
	public int insertSub(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("subscription.insertSub", param);
	}
	
}
