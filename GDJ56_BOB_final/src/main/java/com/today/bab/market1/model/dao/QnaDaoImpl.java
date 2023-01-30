package com.today.bab.market1.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market1.model.vo.ItemQna;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Override
	public int insertQna(SqlSessionTemplate session, ItemQna q) {
		return session.insert("iqna.insertQna",q);
	}
	
	@Override
	public List<ItemQna> selectQnaList(SqlSessionTemplate session, int itemNo){
		return session.selectList("iqna.selectQnaList",itemNo);
	}
	
	@Override
	public int delectQna(SqlSessionTemplate session,int iqNo) {
		return session.delete("iqna.delectQna",iqNo);
	}
}
