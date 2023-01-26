package com.today.bab.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.admin.model.dao.AdminDao;
import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{

	private AdminDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public AdminServiceImpl(AdminDao dao,SqlSessionTemplate session) {
		this.dao=dao;
		this.session=session;
	}
	
	@Override
	public List<Member> adminMembers(Map<String, Integer> param) {
		return dao.adminMembers(session, param);
	}

	@Override
	public int selectMemberListCount() {
		return dao.selectMemberListCount(session);
	}

	@Override
	public AdminMember adminmemberInfo(String id) {
		return dao.adminmemberInfo(session, id);
	}

	@Override
	public List<AdminSubscription> adminSubscription(String id) {
		return dao.adminSubscription(session,id);
	}

	@Override
	public int adminDeleteMember(String memberId) {
		return dao.adminDeleteMember(session,memberId);
	}

	@Override
	public List<AdminMaster> adminMaster(Map<String, Integer> param) {
		return dao.adminMaster(session, param);
	}

	@Override
	public int selectMasterListCount() {
		return dao.selectMasterListCount(session);
	}
	
}
