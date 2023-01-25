package com.today.bab.admin.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.admin.model.dao.AdminDao;
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
		// TODO Auto-generated method stub
		return dao.adminMembers(session, param);
	}

	@Override
	public int selectMemberListCount() {
		// TODO Auto-generated method stub
		return dao.selectMemberListCount(session);
	}
	
}
