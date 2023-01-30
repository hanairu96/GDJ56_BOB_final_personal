package com.today.bab.market1.model.service;

import java.util.List;

import com.today.bab.market1.model.vo.ItemQna;

public interface QnaService {
	
	int insertQna(ItemQna q);
	
	List<ItemQna> selectQnaList();
}
