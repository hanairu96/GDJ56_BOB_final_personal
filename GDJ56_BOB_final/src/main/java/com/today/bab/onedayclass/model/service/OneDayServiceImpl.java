package com.today.bab.onedayclass.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.dao.OneDayDao;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OdcReview;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Service
public class OneDayServiceImpl implements OneDayService {

	private SqlSessionTemplate session;
	private OneDayDao dao;
	
	@Autowired
	public OneDayServiceImpl(SqlSessionTemplate session,OneDayDao dao) {
		this.session = session;
		this.dao = dao;
	}

	@Override
	public List<OneDayClass> selectClassList() {
		return dao.selectClassList(session);
	}

	@Override
	public List<OneDayClass> selectMenuClassList(String type) {

		return dao.selectMenuClassList(session,type);
	}

	@Override
	public List<OneDayClass> selectSearchClass(Map<String, Object> param) {
		return dao.selectSearchClass(session,param);
	}

	@Override
	public int masterEndEnroll(AdminMaster m) {
		return dao.masterEndEnroll(session, m);
	}

	@Override
	public AdminMaster selectMastserById(String memberId) {
		return dao.selectMastserById(session, memberId);
	}

	@Override
	public int endclassEnroll(OneDayClass odc) {
		return dao.endclassEnroll(session, odc);
	}

	@Override
	public OneDayClass odcView(String no) {
		return dao.odcView(session,no);
	}

	@Override
	public void inputOdcQa(OdcQa oq) {
		dao.inputOdcQa(session,oq);
	}

	@Override
	public List<OdcQa> selectOdcQaAll(int odcNo) {
		return dao.selectOdcQaAll(session,odcNo);
	}

	@Override
	public void inputReplayOdcQa(OdcQaRe oqr) {
		dao.inputReplayOdcQa(session, oqr);
	}

	@Override
	public List<OdcQaRe> selectReOdcQaAll(int oqNo) {
		return dao.selectReOdcQaAll(session,oqNo);
	}

	@Override
	public List<OdcReserve> selectReserve(Map param) {
		return dao.selectReserve(session,param);
	}

	@Override
	public List<OdcReview> selectReview(int no) {
		return dao.selectReview(session,no);
	}

	@Override
	public List<OdcReserve> selectNoReviewReserve(int no2) {
		return dao.selectNoReviewReserve(session,no2);
	}

	@Override
	public int insertReview(OdcReview or) {
		return dao.insertReview(session, or);
	}
	
	@Override
	public List<OdcReview> selectReviewByodcNo(int odcNo) {
		return dao.selectReviewByodcNo(session,odcNo);
	}

	@Override
	public int countPerson(Map param) {
		return dao.countPerson(session,param);
	}

	@Override
	public int inputReservation(Map param) {
		return dao.inputReservation(session, param);
	}
	
	
	
	
	
	
	
	
	
	

}
