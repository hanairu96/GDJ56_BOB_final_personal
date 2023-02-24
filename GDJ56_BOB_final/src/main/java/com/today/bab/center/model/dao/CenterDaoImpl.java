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
	public List<Notice> selectNoticeListSearch(SqlSessionTemplate session, Map<String, Integer> page, Map<String, String> param) {
		return session.selectList("center.selectNoticeListSearch", param,
				new RowBounds(
						(page.get("cPage")-1)*page.get("numPerpage"),
						page.get("numPerpage")));
	}
	
	@Override
	public int selectNoticeCount(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectOne("center.selectNoticeCountSearch", param);
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
	public List<ClientQNA> selectCqListSearch(SqlSessionTemplate session, Map<String, Integer> page, Map<String, String> param) {
		return session.selectList("center.selectCqListSearch", param,
				new RowBounds(
						(page.get("cPage")-1)*page.get("numPerpage"),
						page.get("numPerpage")));
	}
	
	@Override
	public int selectCqCount(SqlSessionTemplate session, Map<String, String> param) {
		return session.selectOne("center.selectCqCountSearch", param);
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
	
	@Override
	public int answerUpdate(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("center.answerUpdate", param);
	}

	@Override
	public int answerDelete(SqlSessionTemplate session, int no) {
		return session.delete("center.answerDelete", no);
	}
	
	@Override
	public int updateCheck2(SqlSessionTemplate session, int no) {
		return session.update("center.updateCheck2", no);
	}
	
	@Override
	public int noticeWriteEnd(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("center.noticeWriteEnd", param);
	}
	
	@Override
	public int noticeUpdate(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("center.noticeUpdate", param);
	}

	@Override
	public int noticeDelete(SqlSessionTemplate session, int no) {
		return session.delete("center.noticeDelete", no);
	}

	@Override
	public int cqWriteEnd(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("center.cqWriteEnd", param);
	}

	@Override
	public int cqUpdate(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("center.cqUpdate", param);
	}
	
	@Override
	public int cqDelete(SqlSessionTemplate session, int no) {
		return session.delete("center.cqDelete", no);
	}
	
}
