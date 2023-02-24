package com.today.bab.member.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.member.model.vo.Member;

public interface MemberDao {
	Member selectMemberById(SqlSessionTemplate session, Member m);
	Member idDuplicateCheck(SqlSessionTemplate session, String inputId);
	Member nicknameDuplicateCheck(SqlSessionTemplate session, String nickname);
	Member emailDuplicateCheck(SqlSessionTemplate session, String email);
	int enrollMember(SqlSessionTemplate session, Member m);
	int enrollMemberLike(SqlSessionTemplate session, MemberLike ml);
	int insertPoint(SqlSessionTemplate session, String memberId);
	Member selectMemberByEmail(SqlSessionTemplate session, String email);
	int updatePwd(SqlSessionTemplate session, Member m);
}
