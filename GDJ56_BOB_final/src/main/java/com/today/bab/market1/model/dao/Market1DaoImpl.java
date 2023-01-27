package com.today.bab.market1.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;

@Repository
public class Market1DaoImpl implements Market1Dao {
	@Override
	public List<SellItem> selectItemCtg(SqlSessionTemplate session){
		return session.selectList("ma.selectItemCtg");
	}
	
	@Override
	public SellItem marketdetail(SqlSessionTemplate session, int itemNo){
		return session.selectOne("ma.marketdetail",itemNo);
	}
	
	@Override
	public int insertItem(SqlSessionTemplate session,SellItem s) {
		return session.insert("ma.insertItem",s);
	}
	
	@Override
	public int insertItemPic(SqlSessionTemplate session,ItemPic pic) {
		return session.insert("ma.insertItemPic",pic);
	}
	
	@Override
	public int deleteItem(SqlSessionTemplate session,int itemNo) {
		return session.delete("ma.deleteItem",itemNo);
	}
	
	@Override
	public List<SellItem> selectItemMarket(SqlSessionTemplate session){
		return session.selectList("ma.selectItemMarket");
	}
	
	@Override
	public int updateMarketItem(SqlSessionTemplate session,SellItem s) {
		return session.update("ma.updateMarketItem",s);
	}
	
	@Override
	public 	int updateItemPic(SqlSessionTemplate session,ItemPic keys) {
		return session.update("ma.updateItemPic",keys);
	}
	
	@Override
	public int deleteItemPic(SqlSessionTemplate session,int itemNo) {
		return session.delete("ma.deleteItemPic",itemNo);
	}
}
