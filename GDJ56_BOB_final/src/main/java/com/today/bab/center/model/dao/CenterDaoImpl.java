package com.today.bab.center.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.center.model.vo.Notice;

@Repository
public class CenterDaoImpl implements CenterDao {

	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate session, Map<String, Integer> page) {
		return session.selectList("center.selectNoticeList", null,
				new RowBounds(
						(page.get("cPage")-1)*page.get("numPerpage"),
						page.get("numPerpage")));
	}

	@Override
	public int selectNoticeCount(SqlSessionTemplate session) {
		return session.selectOne("center.selectNoticeCount");
	}

	@Override
	public List<ClientQNA> selectCqList(SqlSessionTemplate session, Map<String, Integer> page) {
		return session.selectList("center.selectCqList", null,
				new RowBounds(
						(page.get("cPage")-1)*page.get("numPerpage"),
						page.get("numPerpage")));
	}

	@Override
	public int selectCqCount(SqlSessionTemplate session) {
		return session.selectOne("center.selectCqCount");
	}

	@Override
	public Notice selectNotice(SqlSessionTemplate session, int no) {
		return session.selectOne("center.selectNotice", no);
	}

	@Override
	public ClientQNA selectClientQna(SqlSessionTemplate session, int no) {
		return session.selectOne("center.selectClientQna", no);
	}

	@Override
	public int answerEnroll(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("center.answerEnroll", param);
	}

	@Override
	public int updateCheck(SqlSessionTemplate session, int no) {
		return session.update("center.updateCheck", no);
	}
	
}
