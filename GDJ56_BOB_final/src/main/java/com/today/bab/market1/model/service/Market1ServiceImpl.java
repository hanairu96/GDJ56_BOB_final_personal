package com.today.bab.market1.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.Market1Dao;
import com.today.bab.market1.model.vo.MarketMemberLike;
import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;


@Service
public class Market1ServiceImpl implements Market1Service{

	private Market1Dao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public Market1ServiceImpl(Market1Dao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public List<SellItem> selectItemCtg(Map<String, Integer> param){
		return dao.selectItemCtg(session,param);
	}
	
	@Override
	public SellItem marketdetail(int itemNo){
		return dao.marketdetail(session, itemNo);
	}
	
	@Override
	public int insertItem(SellItem s) {
		int result=dao.insertItem(session,s);
		if(result>0) {
			for(ItemPic pic : s.getIpic()) {
				pic.setSellitem(s);
				result+=dao.insertItemPic(session,pic);
			}
		}
		return result;
	}
	
	@Override
	public int deleteItem(int itemNo) {
		return dao.deleteItem(session,itemNo);
	}
	
	@Override
	public List<SellItem> selectItemMarket(){
		return dao.selectItemMarket(session);
	}
	
	@Override
	public int updateMarketItem(SellItem s,int itemNo) {
	
		int result=dao.updateMarketItem(session,s);
		
		if(result>0) {
			result+=dao.deleteItemPic(session,itemNo);
			for(ItemPic pic : s.getIpic()) {
				pic.setSellitem(s);
				result+=dao.insertItemPic(session,pic);
			}
		}
//			if(result>0) {
//				List<ItemPic> list=(List<ItemPic>)param.get("picName");
//				for(ItemPic ip:list) {
//					System.out.println(ip);
//					result+=dao.updateItemPic(session, ip);
//				}
//			Iterator keys = param.keySet().iterator();
//			while(keys.hasNext()){
//				String key=(String)keys.next();
//				result+=dao.updateItemPic(session,key);
		return result;
	}
	
//	@Override
//	public List<SellItem> selectCtgAjax(String itemCategory){
//		return dao.selectCtgAjax(session,itemCategory);
//	}
	
	@Override
	public int selectItemCount() {
		return dao.selectItemCount(session);
	}
	
	@Override
	public MarketMemberLike memberLike(String memberId){
		return dao.memberLike(session,memberId);
	}
	
	@Override
	public List<SellItem> selectMainLike(String like) {
		return dao.selectMainLike(session,like);
	}
	
	@Override
	public List<SellItem> searchItemSort(Map<String,Object> param){
		return dao.searchItemSort(session,param);
	}
	
	@Override
	public List<SellItem> soldoutsoon(){
		return dao.soldoutsoon(session);
	}
}
