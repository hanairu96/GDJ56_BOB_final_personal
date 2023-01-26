package com.today.bab.admin.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.member.model.vo.Member;

public interface AdminService {

	List<Member> adminMembers(Map<String,Integer> param);
	
	int selectMemberListCount();
	
	AdminMember adminmemberInfo(String id);
	
	List<AdminSubscription> adminSubscription(String id);
	
	int adminDeleteMember(String memberId);
	
	List<AdminMaster> adminMaster(Map<String,Integer> param);
	
	int selectMasterListCount();
}
