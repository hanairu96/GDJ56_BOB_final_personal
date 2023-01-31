package com.today.bab.onedayclass.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.vo.OdcQa;
import com.today.bab.onedayclass.model.vo.OdcQaRe;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OneDayClass;

public interface OneDayDao {
	
	List<OneDayClass> selectClassList(SqlSessionTemplate session);
	List<OneDayClass> selectMenuClassList(SqlSessionTemplate session,String type);
	List<OneDayClass> selectSearchClass(SqlSessionTemplate session,Map<String, Object> param );
	int masterEndEnroll(SqlSessionTemplate session,AdminMaster m);
	AdminMaster selectMastserById(SqlSessionTemplate session,String memberId);
	int endclassEnroll(SqlSessionTemplate session,OneDayClass odc);
	OneDayClass odcView(SqlSessionTemplate session, String no);
	void inputOdcQa(SqlSessionTemplate session,OdcQa oq);
	List<OdcQa> selectOdcQaAll(SqlSessionTemplate session, int odcNo);
	void inputReplayOdcQa(SqlSessionTemplate session, OdcQaRe oqr);
	List<OdcQaRe> selectReOdcQaAll(SqlSessionTemplate session, int oqNo);
	List<OdcReserve> selectReserve(SqlSessionTemplate session, Map param);
}
