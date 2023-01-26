package com.today.bab.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectMemberById(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMemberById", m);
	}

	@Override
	public Member idDuplicateCheck(SqlSessionTemplate session, String inputId) {
		return session.selectOne("member.idDuplicateCheck", inputId);
	}

	@Override
	public Member emailDuplicateCheck(SqlSessionTemplate session, String email) {
		return session.selectOne("member.emailDuplicateCheck", email);
	}

	@Override
	public int enrollMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.enrollMember", m);
	}

	@Override
	public int enrollMemberLike(SqlSessionTemplate session, MemberLike ml) {
		return session.insert("member.enrollMemberLike", ml);
	}
	
}
