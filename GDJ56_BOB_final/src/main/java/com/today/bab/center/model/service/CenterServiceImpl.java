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

	@Override
	public Notice selectNotice(int no) {
		return dao.selectNotice(session, no);
	}

	@Override
	public ClientQNA selectClientQna(int no) {
		return dao.selectClientQna(session, no);
	}

	@Override
	public int answerEnroll(Map<String, Object> param) {
		int resultEnroll=dao.answerEnroll(session, param);
		int resultUpdate=dao.updateCheck(session, (int)param.get("no"));
		
		int result=0;
		if(resultEnroll>0&&resultUpdate>0) {
			result=1;
		}
		return result;
	}

	@Override
	public int answerUpdate(Map<String, Object> param) {
		int result=dao.answerUpdate(session, param);
		
		return result;
	}
	
}
