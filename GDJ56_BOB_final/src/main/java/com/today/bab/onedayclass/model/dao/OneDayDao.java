package com.today.bab.onedayclass.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.onedayclass.model.vo.OneDayClass;

public interface OneDayDao {
	
	List<OneDayClass> selectClassList(SqlSessionTemplate session);
	List<OneDayClass> selectMenuClassList(SqlSessionTemplate session,String type);
	List<OneDayClass> selectSearchClass(SqlSessionTemplate session,String[] arr );
	
}
