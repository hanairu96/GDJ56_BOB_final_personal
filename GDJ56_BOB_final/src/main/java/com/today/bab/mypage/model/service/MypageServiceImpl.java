package com.today.bab.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.basket.model.vo.Basket;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.mypage.model.dao.MypageDao;
import com.today.bab.mypage.model.vo.ItemDetail;
import com.today.bab.mypage.model.vo.ItemOrder;
import com.today.bab.mypage.model.vo.ItemOrderSellitem;
import com.today.bab.mypage.model.vo.OnedayclassMember;
import com.today.bab.mypage.model.vo.Point;
import com.today.bab.onedayclass.model.vo.OdcReserve;
import com.today.bab.onedayclass.model.vo.OneDayClass;

@Service
public class MypageServiceImpl implements MypageService {
	
	private MypageDao mypageDao;
	private SqlSessionTemplate session;
	
	@Autowired
	public MypageServiceImpl(MypageDao mypageDao,SqlSessionTemplate session) {
		this.mypageDao=mypageDao;
		this.session=session;
	}
	
	@Override
	public List<Basket> selectBasketById(String userId) {
		return mypageDao.selectBasketById(session,userId);
	}
	
	@Override
	public int updateBasketCount(Basket b) {
		return mypageDao.updateBasketCount(session,b);
	}
	
	@Override
	public int deleteBasketCount(int dbasketNo) {
		return mypageDao.deleteBasketCount(session,dbasketNo);
	}

	@Override
	public AdminMember selectMyInfo(AdminMember m) {
		return mypageDao.selectMyInfo(session,m);
	}

	@Override
	public int updateMember(AdminMember am) {
		return mypageDao.updateMember(session,am);
	}

	@Override
	public int updateMemberLike(MemberLike ml) {
		return mypageDao.updateMemberLike(session,ml);
	} 
	
	@Override
	public List<Basket> basketOrderList(String[] basketno) {
		return mypageDao.basketOrderList(session, basketno);
	} 
	
	@Override
	@Transactional
	public int insertItemOrder(ItemOrder io, List<ItemDetail> ids, String[] basketss, Point up) {
		int result= mypageDao.insertItemOrder(session, io);
		//System.out.println(io.getOrderNo());
		//System.out.println(ids.size()+"ids");
		
		if(result>0) {
			for(int i=0;i<ids.size();i++) {
				ids.get(i).setOrderNo(io.getOrderNo());
				System.out.println(ids.get(i).getOrderNo());
			}
			result=0;
			result=mypageDao.insertItemDetail(session,ids);
			if(result>0) {
				result=0;
				result=mypageDao.deleteBasketOrder(session, basketss);  
				if(result>0) {
					result=0;
					result=mypageDao.updateMinusStock(session, ids);  
					if(up.getPointChange()>0) {
						//System.out.println(up.getPointChange());
						result=0;
						result=mypageDao.insertPoint(session, up);
					}else {
						//System.out.println(up.getPointChange());
						result=1;
					}
				}else {
					result=0;
				}
			}else {
				result=0;
			}
		}else {
			result=0;
		}
		
		return result;
	}
	
	@Override
	public int selectpointAll(String memberId) {
		return mypageDao.selectpointAll(session,memberId);
	}
	
	@Override
	public List<Point> selectListPoint(Map<String,Integer> param,String memberId) {
		return mypageDao.selectListPoint(session,memberId,param);
	}
	
	@Override
	public int selectListPointCount(String memberId) {
		return mypageDao.selectListPointCount(session,memberId);
	}
	
	@Override
	public List<ItemOrder> selectItemOrderList(Map<String, Integer> param, String memberId) {
		return mypageDao.selectItemOrderList(session,param,memberId);
	}
	
	@Override
	public int selectItemOrderListCount(String memberId) {
		return mypageDao.selectItemOrderListCount(session,memberId);
	}
	
	@Override
	public List<ItemOrderSellitem> selectOrderSellItem(String memberId) {
		return mypageDao.selectOrderSellItem(session,memberId);
	}
	
	@Override
	public List<ItemOrderSellitem> selectListItemDetail(int orderNo) {
		return mypageDao.selectListItemDetail(session,orderNo);
	}
	
	@Override
	public ItemOrder selectOrderDetail(int orderNo) {
		return mypageDao.selectOrderDetail(session,orderNo);
	}
	
	@Override
	public int updateOrderCancel(ItemOrder io) {
		return mypageDao.updateOrderCancel(session,io);
	}
	
	@Override
	public int updateOrderConfirm(int orderNo) {
		return mypageDao.updateOrderConfirm(session,orderNo);
	}
	
	@Override
	public List<OdcReserve> selectOnedayclass(Map<String,Integer> param,String memberId) {
		return mypageDao.selectOnedayclass(param,session,memberId);
	}
	
	@Override
	public List<ItemReview> selectReviewByOrderNo(int orderNo) {
		return mypageDao.selectReviewByOrderNo(session,orderNo);
	}
	
	@Override
	public String selectMemberMaster(String memberId) {
		return mypageDao.selectMemberMaster(session,memberId);
	}
	
	@Override
	public List<OneDayClass> selectOnedayclassMaster(Map<String,Integer> param,String memberId) {
		return mypageDao.selectOnedayclassMaster(session, memberId,param);
	}
		
	@Override
	public int selectOnedayclassCount(String memberId) {
		return mypageDao.selectOnedayclassCount(session,memberId);
	}
	
	@Override
	public int selectOnedayclassMasterCount(String memberId) {
		return mypageDao.selectOnedayclassMasterCount(session,memberId);
	}
	
	@Override
	public List<OnedayclassMember> selectOnedayclassMember(Map<String,Object> param) {
		return mypageDao.selectOnedayclassMember(session,param);
	}
}
