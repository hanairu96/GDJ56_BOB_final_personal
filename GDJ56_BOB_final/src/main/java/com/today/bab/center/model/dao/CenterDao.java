package com.today.bab.center.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.center.model.vo.Notice;

public interface CenterDao {
	List<Notice> selectNoticeList(SqlSessionTemplate session, Map<String, Integer> page);
	int selectNoticeCount(SqlSessionTemplate session);
	List<ClientQNA> selectCqList(SqlSessionTemplate session, Map<String, Integer> page);
	int selectCqCount(SqlSessionTemplate session);
	Notice selectNotice(SqlSessionTemplate session, int no);
	ClientQNA selectClientQna(SqlSessionTemplate session, int no);
	int answerEnroll(SqlSessionTemplate session, Map<String, Object> param);
	int updateCheck(SqlSessionTemplate session, int no);
	int answerUpdate(SqlSessionTemplate session, Map<String, Object> param);
	int noticeWriteEnd(SqlSessionTemplate session, Map<String, Object> param);
	int noticeUpdate(SqlSessionTemplate session, Map<String, Object> param);
	int noticeDelete(SqlSessionTemplate session, int no);
	int cqWriteEnd(SqlSessionTemplate session, Map<String, Object> param);

	int cqDelete(SqlSessionTemplate session, int no);
}
