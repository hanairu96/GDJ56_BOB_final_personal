package com.today.bab.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.member.model.vo.Member;
import com.today.bab.mypage.model.vo.ClientQaMypage;
import com.today.bab.mypage.model.vo.ItemDetail;
import com.today.bab.mypage.model.vo.ItemOrder;
import com.today.bab.mypage.model.vo.ItemOrderSellitem;
import com.today.bab.mypage.model.vo.MarketRe;
import com.today.bab.mypage.model.vo.MypageQnaAll;
import com.today.bab.mypage.model.vo.OnedayRe;
import com.today.bab.mypage.model.vo.OnedayclassMember;
import com.today.bab.mypage.model.vo.Point;
import com.today.bab.mypage.model.vo.Sub;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Repository("com.today.bab.mypage.model.dao.MypageDaoImpl")
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
	
	@Override
	public List<ItemOrder> selectItemOrderList(SqlSessionTemplate session, Map<String, Integer> param,
			String memberId) {
		return session.selectList("mypage.selectItemOrderList",memberId
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage")));
	}
	
	@Override
	public int selectItemOrderListCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectItemOrderListCount",memberId);
	}
	
	@Override
	public List<ItemOrderSellitem> selectOrderSellItem(SqlSessionTemplate session, String memberId) {
		return session.selectList("mypage.selectOrderSellItem",memberId);
	}
	
	@Override
	public List<ItemOrderSellitem> selectListItemDetail(SqlSessionTemplate session, int orderNo) {
		return session.selectList("mypage.selectListItemDetail",orderNo);
	}
	
	@Override
	public ItemOrder selectOrderDetail(SqlSessionTemplate session, int orderNo) {
		return session.selectOne("mypage.selectOrderDetail",orderNo);
	}
	
	@Override
	public int updateOrderCancel(SqlSessionTemplate session, ItemOrder io) {
		return session.update("mypage.updateOrderCancel",io);
	}
	
	@Override
	public int updateOrderConfirm(SqlSessionTemplate session, int orderNo) {
		return session.update("mypage.updateOrderConfirm",orderNo);
	}
	
	@Override
	public List<OdcReserve> selectOnedayclass(Map<String,Integer> param,SqlSessionTemplate session, String memberId) {
		return session.selectList("mypage.selectOnedayclass",memberId
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage")));
	}
	
	
	@Override
	public List<ItemReview> selectReviewByOrderNo(SqlSessionTemplate session, int orderNo) {
		return session.selectList("mypage.selectReviewByOrderNo",orderNo);
	}
	
	@Override
	public String selectMemberMaster(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectMemberMaster",memberId);
	}
	
	@Override
	public List<OneDayClass> selectOnedayclassMaster(SqlSessionTemplate session, String memberId,Map<String,Integer> param) {
		return session.selectList("mypage.selectOnedayclassMaster",memberId
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage")));
	}
	
	@Override
	public int selectOnedayclassCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectOnedayclassCount",memberId);
	}
	
	@Override
	public int selectOnedayclassMasterCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectOnedayclassMasterCount",memberId);
	}
	
	@Override
	public List<OnedayclassMember> selectOnedayclassMember(SqlSessionTemplate session, Map<String,Object> param) {
		return session.selectList("mypage.selectOnedayclassMember",param);
	}
	
	@Override
	public List<ClientQaMypage> selectQaList(SqlSessionTemplate session, Map<String, Integer> param, String memberId) {
		return session.selectList("mypage.selectQaList",memberId
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage")));
	}
	
	@Override
	public int selectQaListCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectQaListCount",memberId);
	}
	
	@Override
	public List<Sub> selectSubscription(SqlSessionTemplate session, Map<String, Integer> param, String memberId) {
		return session.selectList("mypage.selectSubscription",memberId
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage")));
	}
	
	@Override
	public int selectSubscriptionCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectSubscriptionCount",memberId);
	}
	
	@Override
	public int deleteSub(SqlSessionTemplate session, int subNo) {
		return session.delete("mypage.deleteSub",subNo);
	}
	
	@Override
	public int selectBasketAllCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectBasketAllCount",memberId);
	}
	
	@Override
	public int selectWriteAllCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectWriteAllCount",memberId);
	}
	
	@Override
	public int selectRecentPoint(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectRecentPoint",memberId);
	}
	
	@Override
	public List<MypageQnaAll> selectMypageQnaAll(SqlSessionTemplate session, Map<String, Integer> param,
			String memberId) {
		return session.selectList("mypage.selectMypageQnaAll",memberId
				,new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
				param.get("numPerpage")));
	}
	
	@Override
	public int selectMypageQnaAllCount(SqlSessionTemplate session, String memberId) {
		return session.selectOne("mypage.selectMypageQnaAllCount",memberId);
	}
	
	@Override
	public List<MarketRe> selectMarketRe(SqlSessionTemplate session, int qnaNo) {
		return session.selectList("mypage.selectMarketRe",qnaNo);
	}
	
	@Override
	public List<OnedayRe> selectOnedayRe(SqlSessionTemplate session, int qnaNo) {
		return session.selectList("mypage.selectOnedayRe",qnaNo);
	}
	
	@Override
	public int updatePassword(SqlSessionTemplate session, Member m) {
		return session.update("mypage.updatePassword",m);
	}
}
