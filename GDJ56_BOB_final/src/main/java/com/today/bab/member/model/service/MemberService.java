package com.today.bab.member.model.service;

import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.member.model.vo.Member;

public interface MemberService {
	
	int login(String id, String password);
	Member selectMemberById(Member m);
	Member idDuplicateCheck(String inputId);
	Member emailDuplicateCheck(String email);
	int enrollMemberEnd(Member m, MemberLike ml);
}
