package com.today.bab.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.mypage.model.vo.ItemDetail;
import com.today.bab.mypage.model.vo.ItemOrder;
import com.today.bab.mypage.model.vo.ItemOrderSellitem;
import com.today.bab.mypage.model.vo.ItemOrderSellitem;
import com.today.bab.mypage.model.vo.Point;

public interface MypageService {
	List<Basket> selectBasketById(String userId);
	
	int updateBasketCount(Basket b);
	
	int deleteBasketCount(int dbasketNo);
	
	AdminMember selectMyInfo(AdminMember m);
	
	int updateMember(AdminMember am);
	
	int updateMemberLike(MemberLike ml);
	
	List<Basket> basketOrderList(String[] basketno);
	
	int insertItemOrder(ItemOrder io,List<ItemDetail> ids,String[] basketss,Point use_point);
	
	int selectpointAll(String memberId);
	
	List<Point> selectListPoint(Map<String,Integer> param,String memberId);
	
	int selectListPointCount(String memberId);
	
	List<ItemOrder> selectItemOrderList(Map<String,Integer> param,String memberId);
	
	int selectItemOrderListCount(String memberId);
	
	List<ItemOrderSellitem> selectOrderSellItem(String memberId);
	
}
