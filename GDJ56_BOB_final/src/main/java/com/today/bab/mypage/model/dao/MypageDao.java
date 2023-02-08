package com.today.bab.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.ItemReview;
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
	
	List<OdcReserve> selectOnedayclass(Map<String,Integer> param,SqlSessionTemplate session,String memberId);
	
	List<ItemReview> selectReviewByOrderNo(SqlSessionTemplate session,int orderNo);
	
	String selectMemberMaster(SqlSessionTemplate session,String memberId);
	
	List<OneDayClass> selectOnedayclassMaster(SqlSessionTemplate session,String memberId,Map<String,Integer> param);
	
	int selectOnedayclassCount(SqlSessionTemplate session,String memberId);
	
	int selectOnedayclassMasterCount(SqlSessionTemplate session,String memberId);
	
	List<OnedayclassMember> selectOnedayclassMember(SqlSessionTemplate session,Map<String,Object> param);
	
	List<ClientQaMypage> selectQaList(SqlSessionTemplate session,Map<String,Integer> param,String memberId);
	
	int selectQaListCount(SqlSessionTemplate session,String memberId);
	
	List<Sub> selectSubscription(SqlSessionTemplate session,Map<String,Integer> param,String memberId);
	
	int selectSubscriptionCount(SqlSessionTemplate session,String memberId);
	
	int deleteSub(SqlSessionTemplate session,int subNo);
	
	int selectBasketAllCount(SqlSessionTemplate session,String memberId);
	
	int selectWriteAllCount(SqlSessionTemplate session,String memberId);
	
	int selectRecentPoint(SqlSessionTemplate session,String memberId);
	
	List<MypageQnaAll> selectMypageQnaAll(SqlSessionTemplate session,Map<String,Integer> param,String memberId);
    
    int selectMypageQnaAllCount(SqlSessionTemplate session,String memberId);
    
    List<MarketRe> selectMarketRe(SqlSessionTemplate session,int qnaNo);
    
    List<OnedayRe> selectOnedayRe(SqlSessionTemplate session,int qnaNo);
}
