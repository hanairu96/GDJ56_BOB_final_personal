package com.today.bab.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminQnaAll;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.admin.model.vo.CqAnswer;
import com.today.bab.member.model.vo.Member;

public interface AdminDao {

	List<Member> adminMembers(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectMemberListCount(SqlSessionTemplate session);
	
	AdminMember adminmemberInfo(SqlSessionTemplate session, String id);
	
	List<AdminSubscription> adminSubscription(SqlSessionTemplate session, String id);
	
	int adminDeleteMember(SqlSessionTemplate session, String memberId);
	
	List<AdminMaster> adminMaster(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectMasterListCount(SqlSessionTemplate session);
	
	int selectMasterIngListCount(SqlSessionTemplate session);
	
	int selectMasterAllListCount(SqlSessionTemplate session);
	
	AdminMaster adminMasterInfo(SqlSessionTemplate session, String name);
	
	int masterDelete(SqlSessionTemplate session, AdminMaster m);
	
	int masterDelete2(SqlSessionTemplate session, String memberId);
	
	int masterTestEnd(SqlSessionTemplate session, AdminMaster m);
	
	List<ClientQNA> selectQnAList(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectQnACount(SqlSessionTemplate session);
	
	ClientQNA selectQna(SqlSessionTemplate session,int cqNo);
	
	int insertqnaAnswer(SqlSessionTemplate session,CqAnswer cq);
	
	int updateClientQNA(SqlSessionTemplate session,int cqNo);
	
	List<AdminQnaAll> adminQnAAll(SqlSessionTemplate session,Map<String,Integer> param);
	
	List<AdminQnaAll> adminQnAOneDay(SqlSessionTemplate session,Map<String,Integer> param);
	
	int adminQnAAllCount(SqlSessionTemplate session);
	
	int qnAMarketCount(SqlSessionTemplate session);
	
	int qnAOnedayCount(SqlSessionTemplate session);
	
}
