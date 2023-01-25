package com.today.bab.admin.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.member.model.vo.Member;

public interface AdminService {

	List<Member> adminMembers(Map<String,Integer> param);
	
	int selectMemberListCount();
}
