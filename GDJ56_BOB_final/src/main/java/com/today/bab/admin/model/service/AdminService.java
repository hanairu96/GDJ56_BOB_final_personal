package com.today.bab.admin.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.today.bab.admin.model.vo.AdminItemOrder;
import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminQnaAll;
import com.today.bab.admin.model.vo.AdminSearch;
import com.today.bab.admin.model.vo.AdminSellItem;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.admin.model.vo.AdminTotalData;
import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.admin.model.vo.CqAnswer;
import com.today.bab.member.model.vo.Member;

public interface AdminService {

	List<Member> adminMembers(Map<String,Integer> param);
	
	int selectMemberListCount();
	
	AdminMember adminmemberInfo(String id);
	
	List<AdminSubscription> adminSubscription(String id);
	
	int adminDeleteMember(String memberId);
	
	List<AdminMaster> adminMaster(Map<String,Integer> param);
	
	int selectMasterListCount();
	
	int selectMasterIngListCount();
	
	int selectMasterAllListCount();
	
	AdminMaster adminMasterInfo(String teachername);
	
	int masterDelete(AdminMaster m);
	
	int masterDelete2(String memberId);
	
	int masterTestEnd(AdminMaster m);
	
	int masterTestEnd2(AdminMaster m);
	
	List<ClientQNA> selectQnAList(Map<String,Integer> param);
	
	int selectQnACount();
	
	ClientQNA selectQna(int cqNo);
	
	int insertqnaAnswer(CqAnswer cq);
	
	int updateClientQNA(int cqNo);
	
	List<AdminQnaAll> adminQnAAll(Map<String,Integer> param);
	
	List<AdminQnaAll> adminQnAOneDay(Map<String,Integer> param);
	
	List<AdminQnaAll> adminQnAMarket(Map<String,Integer> param);
	
	int adminQnAAllCount();
	
	int qnAMarketCount();
	
	int qnAOnedayCount();
	
	List<AdminItemOrder> adminRefund(Map<String,Integer> param);
	
	int adminRefundCount();
	
	AdminItemOrder selectcancelOrder(String merchant_uid);
	
	String getToken() throws IOException;

	void payMentCancle(String token, String merchant_uid, int amount, String string) throws IOException;
	
	int updateItemOrder(AdminItemOrder updateItemOrder);
	
	int insertPoint(AdminItemOrder updatePoint);
	
	List<AdminTotalData> adminTotalData();
	
	List<AdminSellItem> adminProductList(Map<String,Integer> param);
	
	int adminProductCount();
	
	List<Member> memberSearchClass(AdminSearch as);
	
	int memberSearchClassCount(AdminSearch as);
	
	List<AdminMaster> masterSearchClass(AdminSearch as);
	
	int masterSearchClassCount(AdminSearch as);
	
	int masterSearchClassYesCount(AdminSearch as);
	
	int masterSearchClassIngCount(AdminSearch as);
}
