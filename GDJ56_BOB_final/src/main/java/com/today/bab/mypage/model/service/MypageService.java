package com.today.bab.mypage.model.service;

import java.util.List;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;

public interface MypageService {
	List<Basket> selectBasketById(String userId);
	
	int updateBasketCount(Basket b);
	
	int deleteBasketCount(int dbasketNo);
	
	AdminMember selectMyInfo(AdminMember m);
	
	int updateMember(AdminMember am);
	
	int updateMemberLike(MemberLike ml);
}
