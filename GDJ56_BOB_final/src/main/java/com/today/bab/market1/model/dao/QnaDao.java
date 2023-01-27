package com.today.bab.market1.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market1.model.vo.ItemQna;

public interface QnaDao {
	
	int insertQna(SqlSessionTemplate session, ItemQna q);
}
