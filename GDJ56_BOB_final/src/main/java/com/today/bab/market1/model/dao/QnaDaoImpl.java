package com.today.bab.market1.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market1.model.vo.IqAnswer;
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
	
	@Override
	public int qnaAnswerAdmin(SqlSessionTemplate session,IqAnswer iq) {
		return session.insert("iqna.qnaAnswerAdmin",iq);
	}
	
	@Override
	public List<IqAnswer> selectIqAnswer(SqlSessionTemplate session,int itemNo) {
		return session.selectList("iqna.selectIqAnswer",itemNo);
	}
	
	@Override
	public int deleteQnaAnswer(SqlSessionTemplate session,int iqaNo) {
		return session.delete("iqna.deleteQnaAnswer",iqaNo);
	}
	
	@Override
	public List<ItemQna> qnaCheckbox(SqlSessionTemplate session,Map<String,Object> param){
		return session.selectList("iqna.qnaCheckbox",param);
	}
}
