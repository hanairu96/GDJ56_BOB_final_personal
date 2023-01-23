package com.today.bab.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
}
