package com.today.bab.center.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.center.model.dao.CenterDao;
import com.today.bab.center.model.vo.Notice;

@Service
public class CenterServiceImpl implements CenterService {
	
	private CenterDao dao;
	private SqlSessionTemplate session;

	public CenterServiceImpl(CenterDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public List<Notice> selectNoticeList(Map<String, Integer> page) {
		return dao.selectNoticeList(session, page);
	}

	@Override
	public int selectNoticeCount() {
		return dao.selectNoticeCount(session);
	}

	@Override
	public List<ClientQNA> selectCqList(Map<String, Integer> page) {
		return dao.selectCqList(session, page);
	}

	@Override
	public int selectCqCount() {
		return dao.selectCqCount(session);
	}
	
	
}
