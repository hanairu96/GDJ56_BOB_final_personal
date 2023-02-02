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
}
