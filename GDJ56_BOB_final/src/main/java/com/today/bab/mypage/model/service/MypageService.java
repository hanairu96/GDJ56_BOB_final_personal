package com.today.bab.mypage.model.service;

import java.util.List;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.mypage.model.vo.ItemOrder;

public interface MypageService {
	List<Basket> selectBasketById(String userId);
	
	int updateBasketCount(Basket b);
	
	int deleteBasketCount(int dbasketNo);
	
	AdminMember selectMyInfo(AdminMember m);
	
	int updateMember(AdminMember am);
	
	int updateMemberLike(MemberLike ml);
	
	List<Basket> basketOrderList(String[] basketno);
	
	int insertItemOrder(ItemOrder io);
}
