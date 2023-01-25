package com.today.bab.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.member.model.vo.Member;

public interface AdminDao {

	List<Member> adminMembers(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectMemberListCount(SqlSessionTemplate session);
}
