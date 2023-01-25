package com.today.bab.market1.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.Market1Dao;
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
	public List<SellItem> selectItemCtg(){
		return dao.selectItemCtg(session);
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
//			if(result!=s.getIPic().size()) {
//				throw new RuntimeException("다시 확인해주세요");
//			}
		}else {
			throw new RuntimeException("sellitem만 저장");
		}
		return result;
	}

}
