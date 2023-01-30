package com.today.bab.market1.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market1.model.vo.ItemQna;

public interface QnaDao {
	
	int insertQna(SqlSessionTemplate session, ItemQna q);
	
	List<ItemQna> selectQnaList(SqlSessionTemplate session, int itemNo);
}
