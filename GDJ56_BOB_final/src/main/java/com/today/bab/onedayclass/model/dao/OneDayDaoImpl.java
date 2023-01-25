package com.today.bab.onedayclass.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public List<OneDayClass> selectSearchClass(SqlSessionTemplate session, String[] arr ) {
		
		return session.selectList("onedayclass.selectSearchClass",arr);
	}
	
	
	
	

}
