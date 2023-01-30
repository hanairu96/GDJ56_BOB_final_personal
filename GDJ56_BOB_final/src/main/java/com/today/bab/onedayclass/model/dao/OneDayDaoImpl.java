package com.today.bab.onedayclass.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.onedayclass.model.vo.OdcQa;
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
	
	
	
	
	
	
	
	
	
	

}
