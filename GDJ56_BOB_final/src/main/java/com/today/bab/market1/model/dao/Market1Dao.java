package com.today.bab.market1.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;

public interface Market1Dao {
	
	List<SellItem> selectItemCtg(SqlSessionTemplate session);
	
	SellItem marketdetail(SqlSessionTemplate session, int itemNo);
	
	int insertItem(SqlSessionTemplate session,SellItem s);
	
	int insertItemPic(SqlSessionTemplate session,ItemPic pic);
	
	int deleteItem(SqlSessionTemplate session,int itemNo);
	
	List<SellItem> selectItemMarket(SqlSessionTemplate session);
	
}
