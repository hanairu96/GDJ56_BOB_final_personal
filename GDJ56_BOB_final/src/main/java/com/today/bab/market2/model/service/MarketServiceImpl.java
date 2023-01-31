package com.today.bab.market2.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.today.bab.market2.model.dao.MarketDao;
import com.today.bab.market2.model.vo.SellItem;
import com.today.bab.market2.model.vo.TobobDetail;
import com.today.bab.market2.model.vo.TodayBob;

@Service
public class MarketServiceImpl implements MarketService {
	
	private MarketDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MarketServiceImpl(MarketDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<SellItem> sellItemAll(Map<String, Object> param) {
		return dao.sellItemAll(session, param);
	}
	@Override
	public List<SellItem> sellItemByNo(String chItemsTxt) {
		return dao.sellItemByNo(session, chItemsTxt);
	}
	
	@Override
	public List<SellItem> bestItems(String value) {
		return dao.bestItems(session, value);
	}
//	@Override
//	public List<SellItem> bestItemsAjax(String value) {
//		return dao.bestItems(session);
//	}
	
	@Override
	public int discountUpdate(Map<String, Object> param) {
		int result = dao.discountUpdateBefore(session, param);
		if(result>0) {// ! update된 개수도 세야함
			dao.discountUpdate(session, param);
		}
		return dao.discountUpdate(session, param);
	}
	
	@Override
	public List<TodayBob> todayBobList() {
		return dao.todayBobList(session);
	}
	
	@Override
	public int todayBobListCount() {
		return dao.todayBobListCount(session);
	}
	
//	@Override
//	public int deleteTodayBob(int reNo) {
//		return dao.deleteTodayBob(session, reNo);
//	}
//	@Override
//	public int insertTodayBob(TodayBob tb) {
//		return dao.insertTodayBob(session, tb);
//	}
//	@Override
//	public int selectTodayBobByTitle(String reTitle) {
//		return dao.selectTodayBobByTitle(session, reTitle);
//	}
	@Override
	@Transactional
	public int insertTodayBobItems(Map<String, Object> param) {
		
		
		TodayBob tb = (TodayBob)param.get("tb");
		int[] chItems = (int[])param.get("chItems");
		
		//먼저타이틀생성하고
		int result = dao.insertTodayBob(session, tb);
		//생성한타이틀의번호가져와서
		int no = dao.selectTodayBobByTitle(session, tb.getReTitle()); //밑에 상품넣는 것이 실패하면 타이틀이 생성된 것은 rollback되어야함
		System.out.println(no);
		
		//상품등록하기
		
			for(int item : chItems) {//삽입하는 쿼리
				TobobDetail td = TobobDetail.builder().itemNo(SellItem.builder().itemNo(no).build())
						.reNo(TodayBob.builder().reNo(item).build()).build();
				
				dao.insertTodayBobItem(session, td);
			}
		
		
		return 1;
	}
	
	
	
	
}
