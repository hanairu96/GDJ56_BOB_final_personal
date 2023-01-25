package com.today.bab.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.member.model.vo.Member;

public interface AdminDao {

	List<Member> adminMembers(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectMemberListCount(SqlSessionTemplate session);
	
	AdminMember adminmemberInfo(SqlSessionTemplate session, String id);
	
	List<AdminSubscription> adminSubscription(SqlSessionTemplate session, String id);
	
	int adminDeleteMember(SqlSessionTemplate session, String memberId);
}
