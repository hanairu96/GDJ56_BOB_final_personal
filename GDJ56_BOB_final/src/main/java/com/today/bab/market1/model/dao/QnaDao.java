package com.today.bab.market1.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market1.model.vo.IqAnswer;
import com.today.bab.market1.model.vo.ItemQna;

public interface QnaDao {
	
	int insertQna(SqlSessionTemplate session, ItemQna q);
	
	List<ItemQna> selectQnaList(SqlSessionTemplate session, int itemNo);
	
	int delectQna(SqlSessionTemplate session,int iqNo);
	
	int qnaAnswerAdmin(SqlSessionTemplate session,IqAnswer iq);
	
	List<IqAnswer> selectIqAnswer(SqlSessionTemplate session, int iqNo);
}
