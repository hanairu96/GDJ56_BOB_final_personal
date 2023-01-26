package com.today.bab.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.member.model.vo.Member;

public interface MemberDao {
	Member selectMemberById(SqlSessionTemplate session, Member m);
	Member idDuplicateCheck(SqlSessionTemplate session, String inputId);
	Member emailDuplicateCheck(SqlSessionTemplate session, String email);
	int enrollMember(SqlSessionTemplate session, Member m);
	int enrollMemberLike(SqlSessionTemplate session, MemberLike ml);
}
