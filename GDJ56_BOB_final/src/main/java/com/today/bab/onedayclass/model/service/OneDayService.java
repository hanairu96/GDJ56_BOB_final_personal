package com.today.bab.onedayclass.model.service;

import java.util.List;

import com.today.bab.onedayclass.model.vo.OneDayClass;

public interface OneDayService {

	List<OneDayClass> selectClassList();
	List<OneDayClass> selectMenuClassList(String type);
	List<OneDayClass> selectSearchClass(String searchlist, String saerch);
	
}
