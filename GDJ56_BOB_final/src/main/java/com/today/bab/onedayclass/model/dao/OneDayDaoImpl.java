package com.today.bab.onedayclass.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OdcReview;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Repository
public class OneDayDaoImpl implements OneDayDao {

	@Override
	public List<OneDayClass> selectClassList(SqlSessionTemplate session) {
		
		return session.selectList("onedayclass.selectClassList");
	}

	@Override
	public List<OneDayClass> selectMenuClassList(SqlSessionTemplate session, String type) {
		return session.selectList("onedayclass.selectMenuClassList",type);
	}

	@Override
	public List<OneDayClass> selectSearchClass(SqlSessionTemplate session, Map<String, Object> param ) {
		
		return session.selectList("onedayclass.selectSearchClass",param);
	}

	@Override
	public int masterEndEnroll(SqlSessionTemplate session, AdminMaster m) {
		return session.insert("onedayclass.masterEndEnroll", m);
	}

	@Override
	public AdminMaster selectMastserById(SqlSessionTemplate session, String memberId) {
		return session.selectOne("onedayclass.selectMastserById", memberId);
	}

	@Override
	public int endclassEnroll(SqlSessionTemplate session, OneDayClass odc) {
		return session.insert("onedayclass.endclassEnroll", odc);
	}

	@Override
	public OneDayClass odcView(SqlSessionTemplate session, String no) {
		return session.selectOne("onedayclass.odcView", no);
	}

	@Override
	public void inputOdcQa(SqlSessionTemplate session, OdcQa oq) {
		session.insert("onedayclass.inputOdcQa",oq);
	}

	@Override
	public List<OdcQa> selectOdcQaAll(SqlSessionTemplate session, int odcNo) {
		return session.selectList("onedayclass.selectOdcQaAll", odcNo);
	}

	@Override
	public void inputReplayOdcQa(SqlSessionTemplate session, OdcQaRe oqr) {
		session.insert("onedayclass.inputReplayOdcQa",oqr);
	}

	@Override
	public List<OdcQaRe> selectReOdcQaAll(SqlSessionTemplate session, int oqNo) {
		return session.selectList("onedayclass.selectReOdcQaAll", oqNo);
	}

	@Override
	public List<OdcReserve> selectReserve(SqlSessionTemplate session, Map param) {
		return session.selectList("onedayclass.selectReserve", param);
	}

	@Override
	public List<OdcReview> selectReview(SqlSessionTemplate session, int no) {
		return session.selectList("onedayclass.selectReview",no);
	}

	@Override
	public List<OdcReserve> selectNoReviewReserve(SqlSessionTemplate session, int no2) {
		return session.selectList("onedayclass.selectNoReviewReserve",no2);
	}

	@Override
	public int insertReview(SqlSessionTemplate session, OdcReview or) {
		return session.insert("onedayclass.insertReview",or);
	}
	
	
	@Override
	public List<OdcReview> selectReviewByodcNo(SqlSessionTemplate session, int odcNo) {
		return session.selectList("onedayclass.selectReviewByodcNo",odcNo);
	}

	@Override
	public int countPerson(SqlSessionTemplate session, Map param) {
		return session.selectOne("onedayclass.countPerson", param);
	}

	@Override
	public int inputReservation(SqlSessionTemplate session, Map param) {
		return session.insert("onedayclass.inputReservation", param);
	}
	
	

}
