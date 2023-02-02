package com.today.bab.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.mypage.model.vo.ItemDetail;
import com.today.bab.mypage.model.vo.ItemOrder;
import com.today.bab.mypage.model.vo.ItemOrderSellitem;
import com.today.bab.mypage.model.vo.Point;
import com.today.bab.onedayclass.model.vo.OdcReserve;

public interface MypageDao {
	List<Basket> selectBasketById(SqlSessionTemplate session,String userId);
	
	int updateBasketCount(SqlSessionTemplate session,Basket b);
	
	int deleteBasketCount(SqlSessionTemplate session,int dbasketNo);
	
	AdminMember selectMyInfo(SqlSessionTemplate session,AdminMember m);
	
	int updateMember(SqlSessionTemplate session,AdminMember am);
	
	int updateMemberLike(SqlSessionTemplate session,MemberLike ml);
	
	List<Basket> basketOrderList(SqlSessionTemplate session,String[] basketno);
	
	int insertItemOrder(SqlSessionTemplate session,ItemOrder io);
	
	int insertItemDetail(SqlSessionTemplate session,List<ItemDetail> ids);
	
	int deleteBasketOrder(SqlSessionTemplate session,String[] deleteBasketNo);
	
	int updateMinusStock(SqlSessionTemplate session,List<ItemDetail> ids);
	
	int insertPoint(SqlSessionTemplate session,Point up);
	
	int selectpointAll(SqlSessionTemplate session,String memberId);
	
	List<Point> selectListPoint(SqlSessionTemplate session,String memberId,Map<String,Integer> param);
	
	int selectListPointCount(SqlSessionTemplate session,String memberId);
	
	List<ItemOrder> selectItemOrderList(SqlSessionTemplate session,Map<String,Integer> param,String memberId);
	
	int selectItemOrderListCount(SqlSessionTemplate session,String memberId);
	
	List<ItemOrderSellitem> selectOrderSellItem(SqlSessionTemplate session,String memberId);
	
	List<ItemOrderSellitem> selectListItemDetail(SqlSessionTemplate session,int orderNo);
	
	ItemOrder selectOrderDetail(SqlSessionTemplate session,int orderNo);
	
	int updateOrderCancel(SqlSessionTemplate session,ItemOrder io);
	
	int updateOrderConfirm(SqlSessionTemplate session,int orderNo);
	
	List<OdcReserve> selectOnedayclass(SqlSessionTemplate session,String memberId);
}
