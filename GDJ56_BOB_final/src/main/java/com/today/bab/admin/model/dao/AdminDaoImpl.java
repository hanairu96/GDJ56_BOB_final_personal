package com.today.bab.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.AdminItemOrder;
import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminQnaAll;
import com.today.bab.admin.model.vo.AdminSellItem;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.admin.model.vo.AdminTotalData;
import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.admin.model.vo.CqAnswer;
import com.today.bab.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public List<Member> adminMembers(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("admin.adminMembers",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}

	@Override
	public int selectMemberListCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectMemberListCount");
	}

	@Override
	public AdminMember adminmemberInfo(SqlSessionTemplate session, String id) {
		return session.selectOne("admin.adminmemberInfo", id);
	}

	@Override
	public List<AdminSubscription> adminSubscription(SqlSessionTemplate session, String id) {
		return session.selectList("admin.adminSubscription",id);
	}

	@Override
	public int adminDeleteMember(SqlSessionTemplate session, String memberId) {
		return session.delete("admin.adminDeleteMember",memberId);
	}

	@Override
	public List<AdminMaster> adminMaster(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("admin.adminMaster",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}

	@Override
	public int selectMasterListCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectMasterListCount");
	}
	
	@Override
	public int selectMasterIngListCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectMasterIngListCount");
	}
	
	@Override
	public int selectMasterAllListCount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectMasterAllListCount");
	}
	
	@Override
	public AdminMaster adminMasterInfo(SqlSessionTemplate session, String name) {
		return session.selectOne("admin.adminMasterInfo",name);		
	}

	@Override
	public int masterDelete(SqlSessionTemplate session, AdminMaster m) {
		return session.update("admin.masterDelete",m);
	}
	
	@Override
	public int masterDelete2(SqlSessionTemplate session, String memberId) {
		return session.update("admin.masterDelete2",memberId);
	}

	@Override
	public int masterTestEnd(SqlSessionTemplate session, AdminMaster m) {
		return session.update("admin.masterTestEnd",m);
	}

	@Override
	public List<ClientQNA> selectQnAList(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("admin.selectQnAList",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}

	@Override
	public int selectQnACount(SqlSessionTemplate session) {
		return session.selectOne("admin.selectQnACount");
	}

	@Override
	public ClientQNA selectQna(SqlSessionTemplate session, int cqNo) {
		return session.selectOne("admin.selectQna",cqNo);	
	}

	@Override
	public int insertqnaAnswer(SqlSessionTemplate session, CqAnswer cq) {
		return session.insert("admin.insertqnaAnswer",cq);
	}

	@Override
	public int updateClientQNA(SqlSessionTemplate session,int cqNo) {
		return session.update("admin.updateClientQNA",cqNo);
	}

	@Override
	public List<AdminQnaAll> adminQnAAll(SqlSessionTemplate session,Map<String,Integer> param) {
		return session.selectList("admin.adminQnAAll",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}

	@Override
	public int adminQnAAllCount(SqlSessionTemplate session) {
		return session.selectOne("admin.adminQnAAllCount");
	}

	@Override
	public int qnAMarketCount(SqlSessionTemplate session) {
		return session.selectOne("admin.qnAMarketCount");
	}

	@Override
	public int qnAOnedayCount(SqlSessionTemplate session) {
		return session.selectOne("admin.qnAOnedayCount");
	}
	
	@Override
	public List<AdminQnaAll> adminQnAMarket(SqlSessionTemplate session,Map<String,Integer> param) {
		return session.selectList("admin.adminQnAMarket",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}
	
	@Override
	public List<AdminQnaAll> adminQnAOneDay(SqlSessionTemplate session,Map<String,Integer> param) {
		return session.selectList("admin.adminQnAOneDay",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}

	@Override
	public List<AdminItemOrder> adminRefund(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("admin.adminRefund",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}

	@Override
	public int adminRefundCount(SqlSessionTemplate session) {
		return session.selectOne("admin.adminRefundCount");
	}

	@Override
	public AdminItemOrder selectcancelOrder(SqlSessionTemplate session, String merchantUid) {
		return session.selectOne("admin.selectcancelOrder",merchantUid);	
	}

	@Override
	public int updateItemOrder(SqlSessionTemplate session, AdminItemOrder updateItemOrder) {
		return session.update("admin.updateItemOrder",updateItemOrder);
	}

	@Override
	public int insertPoint(SqlSessionTemplate session, AdminItemOrder updatePoint) {
		return session.insert("admin.insertPoint",updatePoint);
	}

	@Override
	public List<AdminTotalData> adminTotalData(SqlSessionTemplate session) {
		return session.selectList("admin.adminTotalData");
	}

	@Override
	public List<AdminSellItem> adminProductList(SqlSessionTemplate session, Map<String, Integer> param) {
		return session.selectList("admin.adminProductList",null, 
	            new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),
	                  param.get("numPerpage")));
	}

	@Override
	public int adminProductCount(SqlSessionTemplate session) {
		return session.selectOne("admin.adminProductCount");
	}
	
}
