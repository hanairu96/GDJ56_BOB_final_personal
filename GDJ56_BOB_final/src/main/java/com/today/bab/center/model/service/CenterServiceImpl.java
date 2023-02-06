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
	public List<Notice> selectNoticeListSearch(Map<String, Integer> page, Map<String, String> param) {
		return dao.selectNoticeListSearch(session, page, param);
	}
	
	@Override
	public int selectNoticeCount(Map<String, String> param) {
		return dao.selectNoticeCount(session, param);
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
		return dao.answerUpdate(session, param);
	}

	@Override
	public int noticeWriteEnd(Map<String, Object> param) {
		return dao.noticeWriteEnd(session, param);
	}
	
	@Override
	public int noticeUpdate(Map<String, Object> param) {
		return dao.noticeUpdate(session, param);
	}

	@Override
	public int noticeDelete(int no) {
		return dao.noticeDelete(session, no);
	}

	@Override
	public int cqWriteEnd(Map<String, Object> param) {
		return dao.cqWriteEnd(session, param);
	}
	
	@Override
	public int cqUpdate(Map<String, Object> param) {
		return dao.cqUpdate(session, param);
	}

	@Override
	public int cqDelete(int no) {
		return dao.cqDelete(session, no);
	}
	
}
