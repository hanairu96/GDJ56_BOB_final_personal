package com.today.bab.member.model.service;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.member.model.dao.MemberDao;
import com.today.bab.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	private MemberDao dao;
	private SqlSessionTemplate session;
	
	public MemberServiceImpl(MemberDao dao, SqlSessionTemplate session) {
		this.dao = dao;
		this.session = session;
	}

	@Override
	public Member selectMemberById(Member m) {
		return dao.selectMemberById(session, m);
	}

	@Override
	public Member idDuplicateCheck(String inputId) {
		return dao.idDuplicateCheck(session, inputId);
	}
	
	@Override
	public Member nicknameDuplicateCheck(String nickname) {
		return dao.nicknameDuplicateCheck(session, nickname);
	}

	@Override
	public Member emailDuplicateCheck(String email) {
		return dao.emailDuplicateCheck(session, email);
	}

//	@Override
//	@Transactional
//	public int enrollMemberEnd(Member m, MemberLike ml) throws SQLException{
//		int result=0;
//		int memberResult=dao.enrollMember(session, m);
//		int likeResult=dao.enrollMemberLike(session, ml);
//		if(memberResult>0 && likeResult>0) {
//			throw new SQLException();
//		}else {
//		}
//		return result;
//	}
	
	@Override
	public int enrollMemberEnd(Member m, MemberLike ml) {
		int result=0;
		int memberResult=dao.enrollMember(session, m);
		int likeResult=dao.enrollMemberLike(session, ml);
		if(memberResult>0 && likeResult>0) {
			result=1;
		}else {
			session.rollback();
			result=0;
		}
		return result;
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return dao.selectMemberByEmail(session, email);
	}

	@Override
	public int updatePwd(Member m) {
		return dao.updatePwd(session, m);
	}

}
