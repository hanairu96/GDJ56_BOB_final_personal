package com.today.bab.onedayclass.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OdcReview;
import com.today.bab.onedayclass.model.vo.OneDayClass;

public interface OneDayService {

	List<OneDayClass> selectClassList(Map<String, Integer> param);
	int countClasslist();
	int searchCountClasslist(Map param);
	List<OneDayClass> selectMenuClassList(Map<String, Object> param);
	List<OneDayClass> selectSearchClass(Map<String, Object> param);
	int masterEndEnroll(AdminMaster m);
	AdminMaster selectMastserById(String memberId);
	int endclassEnroll(OneDayClass odc);
	OneDayClass odcView(String no);
	void inputOdcQa(OdcQa oq);
	List<OdcQa> selectOdcQaAll(int odcNo);
	List<OdcQaRe> selectReOdcQaAll(int oqNo);
	void inputReplayOdcQa(OdcQaRe oqr);
	List<OdcReserve> selectReserve(Map param);
	List<OdcReview> selectReview(int no);
	List<OdcReserve> selectNoReviewReserve(int no2);
	int insertReview(OdcReview or);
	List<OdcReview> selectReviewByodcNo(int odcNo);
	int countPerson(Map param);
	int inputReservation(Map param);
	List<OdcReview> selectReviewById(OdcReview or);
	List<OdcQa> selectQnaById(OdcQa oq);
	List<OdcQa> selectNoQna(int no);
	int countMenuClassList(String type);
	OdcReview selectReviewByodreNo(int no);
	OdcReserve selectReservebyodreNo(int no);
	void deleteOdcQa(String oqno);
	void deleteReOdcQa(String oqrNo);
	void insertPoint(String memberId);
	AdminMaster selectMasterBymname(String name);
	OneDayClass selectMasterByclassName(String name);
	void deleteClass(int odcNo);
}
