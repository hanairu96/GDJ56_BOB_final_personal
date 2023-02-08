package com.today.bab.mypage.model.service;

import java.util.List;
import java.util.Map;

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
	
	List<ItemOrderSellitem> selectListItemDetail(int orderNo);
	
	ItemOrder selectOrderDetail(int orderNo);
	
	int updateOrderCancel(ItemOrder io);
	
	int updateOrderConfirm(int orderNo);
	
	List<OdcReserve> selectOnedayclass(Map<String,Integer> param,String memberId);
	
	List<ItemReview> selectReviewByOrderNo(int orderNo);
	
	String selectMemberMaster(String memberId);
	
	List<OneDayClass> selectOnedayclassMaster(Map<String,Integer> param,String memberId);
	
	int selectOnedayclassCount(String memberId);
	
	int selectOnedayclassMasterCount(String memberId);
	
	List<OnedayclassMember> selectOnedayclassMember(Map<String,Object> param);
	
	List<ClientQaMypage> selectQaList(Map<String,Integer> param,String memberId);
	
	int selectQaListCount(String memberId);
	
	List<Sub> selectSubscription(Map<String,Integer> param,String memberId);
	
	int selectSubscriptionCount(String memberId);
	
	int deleteSub(int subNo);
	
	int selectBasketAllCount(String memberId);
	
	int selectWriteAllCount(String memberId);
	
	int selectRecentPoint(String memberId);
	
	List<MypageQnaAll> selectMypageQnaAll(Map<String,Integer> param,String memberId);
    
    int selectMypageQnaAllCount(String memberId);
    
    List<MarketRe> selectMarketRe(int qnaNo);
    
    List<OnedayRe> selectOnedayRe(int qnaNo);
}
