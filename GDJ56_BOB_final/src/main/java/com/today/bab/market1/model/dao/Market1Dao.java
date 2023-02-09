package com.today.bab.market1.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.market1.model.vo.MarketMemberLike;
import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;

public interface Market1Dao {
	
	List<SellItem> selectItemCtg(SqlSessionTemplate session,Map<String, Integer> param);
	
	SellItem marketdetail(SqlSessionTemplate session, int itemNo);
	
	int insertItem(SqlSessionTemplate session,SellItem s);
	
	int insertItemPic(SqlSessionTemplate session,ItemPic pic);
	
	int deleteItem(SqlSessionTemplate session,int itemNo);
	
	List<SellItem> selectItemMarket(SqlSessionTemplate session);
	
	int updateMarketItem(SqlSessionTemplate session,SellItem s);
	
	int updateItemPic(SqlSessionTemplate session,ItemPic keys);
	
	int deleteItemPic(SqlSessionTemplate session,int itemNo);
	
	//List<SellItem> selectCtgAjax(SqlSessionTemplate session,String itemCategory);
	
	int selectItemCount(SqlSessionTemplate session);
	
	MarketMemberLike memberLike(SqlSessionTemplate session,String memberId);
	
	List<SellItem> selectMainLike(SqlSessionTemplate session,String like);
	
	List<SellItem> searchItemSort(SqlSessionTemplate session,Map<String,Object> param);
	
	List<SellItem> soldoutsoon(SqlSessionTemplate session,Map<String, Integer> param);
}
