package com.today.bab.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;

public interface MypageDao {
	List<Basket> selectBasketById(SqlSessionTemplate session,String userId);
	
	int updateBasketCount(SqlSessionTemplate session,Basket b);
	
	int deleteBasketCount(SqlSessionTemplate session,int dbasketNo);
	
	AdminMember selectMyInfo(SqlSessionTemplate session,AdminMember m);
	
	int updateMember(SqlSessionTemplate session,AdminMember am);
	
	int updateMemberLike(SqlSessionTemplate session,MemberLike ml);
}
