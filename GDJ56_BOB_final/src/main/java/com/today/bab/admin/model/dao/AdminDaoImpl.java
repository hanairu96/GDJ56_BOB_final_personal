package com.today.bab.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminSubscription;
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
		// TODO Auto-generated method stub
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
	
}
