package com.today.bab.onedayclass.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OneDayClass;

public interface OneDayService {

	List<OneDayClass> selectClassList();
	List<OneDayClass> selectMenuClassList(String type);
	List<OneDayClass> selectSearchClass(Map<String, Object> param);
	int masterEndEnroll(AdminMaster m);
	AdminMaster selectMastserById(String memberId);
	int endclassEnroll(OneDayClass odc);
	OneDayClass odcView(String no);
	void inputOdcQa(OdcQa oq);
	List<OdcQa> selectOdcQaAll(int odcNo);
	List<OdcQaRe> selectReOdcQaAll(int oqNo);
	void inputReplayOdcQa(OdcQaRe oqr);
}
