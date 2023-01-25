package com.today.bab.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
}
