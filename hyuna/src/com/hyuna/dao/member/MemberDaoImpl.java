package com.hyuna.dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyuna.vo.MemberVO;
import com.hyuna.vo.TermsVO;
import com.hyuna.vo.Terms_agreeVO;
@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public int memberInsert(MemberVO mvo) {		
		return session.insert("memberInsert");
	}

	@Override
	public int idCheck(MemberVO mvo) {		
		return session.selectOne("idCheck");
	}

	@Override
	public List<TermsVO> termsList() {		
		return session.selectList("termsList");	
	}

	@Override
	public MemberVO findidOk(MemberVO mvo) {		
		return (MemberVO)session.selectOne("findidOk");
	}

	@Override
	public MemberVO memberSelect(MemberVO mvo) {		
		return session.selectOne("memberSelect");
	}

	@Override
	public int agreeInsert(Terms_agreeVO tv) {		
		return session.insert("agreeInsert");
	}

	@Override
	public MemberVO loginCheck(MemberVO mvo) {		
		return session.selectOne("loginCheck");
	}

	@Override
	public int memberPw(MemberVO mvo) {		
		return session.update("memberPw");
	}

	@Override
	public MemberVO throwMember(int mem_no) {		
		return session.selectOne("throwMember");
	}

	@Override
	public int mailcheck(MemberVO mvo) {		
		return session.selectOne("mailcheck");
	}

	@Override
	public int pwdCheck(MemberVO mvo) {		
		return session.selectOne("pwdCheck");
	}

	@Override
	public void memberUpdate(MemberVO mvo) {
		session.update("memberUpdate");
		
	}

	@Override
	public int memberOut(MemberVO mvo) {		
		return session.update("memberOut");
	}

	@Override
	public MemberVO selectEmail(MemberVO mvo) {		
		return session.selectOne("selectEmail");
	}

}
