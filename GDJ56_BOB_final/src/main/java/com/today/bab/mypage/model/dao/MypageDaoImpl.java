package com.today.bab.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.mypage.model.vo.ItemDetail;
import com.today.bab.mypage.model.vo.ItemOrder;
import com.today.bab.mypage.model.vo.Point;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Override
	public List<Basket> selectBasketById(SqlSessionTemplate session, String userId) {
		return session.selectList("mypage.selectBasketById",userId);
	}
	
	@Override
	public int updateBasketCount(SqlSessionTemplate session, Basket b) {
		return session.update("mypage.updateBasketCount",b);
	}
	
	@Override
	public int deleteBasketCount(SqlSessionTemplate session, int dbasketNo) {
		return session.delete("mypage.deleteBasketCount",dbasketNo);
	}

	@Override
	public AdminMember selectMyInfo(SqlSessionTemplate session, AdminMember m) {
		return session.selectOne("mypage.selectMyInfo",m);
	}

	@Override
	public int updateMember(SqlSessionTemplate session, AdminMember am) {
		return session.update("mypage.updateMember",am);
	}

	@Override
	public int updateMemberLike(SqlSessionTemplate session, MemberLike ml) {
		return session.update("mypage.updateMemberLike",ml);
	} 
	
	@Override
	public List<Basket> basketOrderList(SqlSessionTemplate session, String[] basketno) {
		return session.selectList("mypage.basketOrderList",basketno);
	}
	
	@Override
	public int insertItemOrder(SqlSessionTemplate session, ItemOrder io) {
		return session.insert("mypage.insertItemOrder",io);
	}
	
	@Override
	public int insertItemDetail(SqlSessionTemplate session, List<ItemDetail> ids) {
		return session.insert("mypage.insertItemDetail",ids);
	} 
	
	@Override
	public int deleteBasketOrder(SqlSessionTemplate session, String[] deleteBasketNo) {
		return session.delete("mypage.deleteBasketOrder",deleteBasketNo);
	} 
	
	@Override
	public int updateMinusStock(SqlSessionTemplate session, List<ItemDetail> ids) {
		return session.update("mypage.updateMinusStock",ids);
	}
	
	@Override
	public int insertPoint(SqlSessionTemplate session, Point up) {
		return session.insert("mypage.insertPoint",up);
	}
	
	@Override
	public int selectpointAll(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectpointAll",memberId);
	}
	
	@Override
	public List<Point> selectListPoint(SqlSessionTemplate session, String memberId,Map<String,Integer> param) {
		return session.selectList("mypage.selectListPoint",memberId
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage")));
	}
	
	@Override
	public int selectListPointCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectListPointCount",memberId);
	}
}
