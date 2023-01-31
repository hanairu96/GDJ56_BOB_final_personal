package com.today.bab.market2.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TobobDetail;
import com.today.bab.market2.model.vo.TodayBob;

@Repository
public class MarketDaoImpl implements MarketDao {
	
	@Override
	public List<SellItem> sellItemAll(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectList("market2.sellItemAll", param);
	}
	@Override
	public List<SellItem> sellItemByNo(SqlSessionTemplate session, String chItemsTxt) {
		return session.selectList("market2.sellItemByNo", chItemsTxt);
	}
	
//	@Override
//	public List<SellItem> bestItems(SqlSessionTemplate session) {
//		return session.selectList("market2.bestItems");
//	}
//	@Override
//	public List<SellItem> bestItemsAjax(SqlSessionTemplate session, String value) {
//		return session.selectList("market2.bestItemsAjax", value);
//	}
	@Override
	public List<SellItem> bestItems(SqlSessionTemplate session, String data) {
		return session.selectList("market2.bestItems", data!=null?data.trim():data);
	}
	
	@Override
	public int discountUpdateBefore(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("market2.discountUpdateBefore", param);
	}
	@Override
	public int discountUpdate(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("market2.discountUpdate", param);
	}
	
	@Override
	public List<TodayBob> todayBobList(SqlSessionTemplate session) {
		return session.selectList("market2.todayBobList");
	}
	@Override
	public int todayBobListCount(SqlSessionTemplate session) {
		return session.selectOne("market2.todayBobListCount");
	}
	@Override
	public int deleteTodayBob(SqlSessionTemplate session, int reNo) {
		return session.delete("market2.deleteTodayBob", reNo);
	}
	@Override
	public int insertTodayBob(SqlSessionTemplate session, TodayBob tb) {
		return session.insert("market2.insertTodayBob", tb);
	}
	@Override
	public int selectTodayBobByTitle(SqlSessionTemplate session, String reTitle) {
		return session.selectOne("market2.selectTodayBobByTitle", reTitle);
	}
	@Override
	public int insertTodayBobItems(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("market2.insertTodayBobItems", param);
	}
	@Override
	public int insertTodayBobItem(SqlSessionTemplate session, TobobDetail td) {
		return session.insert("market2.insertTodayBobItem", td);
	}
	
	
}
