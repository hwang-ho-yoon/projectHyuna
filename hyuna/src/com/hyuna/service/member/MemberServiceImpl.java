package com.hyuna.service.member;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.member.MemberDao;
import com.hyuna.vo.MemberVO;
import com.hyuna.vo.TermsVO;
import com.hyuna.vo.Terms_agreeVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	Logger logger = Logger.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int memberInsert(MemberVO mvo) {
		int result = 0;
		result = memberDao.memberInsert(mvo);
		return result;
	}

	@Override
	public int idCheck(MemberVO mvo) {
		int result = 0;
		result = memberDao.idCheck(mvo);
		return result;
	}

	@Override
	public List<TermsVO> termsList() {
		List<TermsVO> list = memberDao.termsList();
		return list;
	}

	@Override
	public MemberVO findidOk(MemberVO mvo) {		
		return memberDao.findidOk(mvo); 
	}

	@Override
	public MemberVO memberSelect(MemberVO mvo) {		
		return memberDao.memberSelect(mvo);
	}

	@Override
	public int agreeInsert(Terms_agreeVO tv) {		
		return memberDao.agreeInsert(tv);
	}

	@Override
	public MemberVO loginCheck(MemberVO mvo) {		
		return memberDao.loginCheck(mvo);
	}

	@Override
	public int memberPw(MemberVO mvo) {		
		return memberDao.memberPw(mvo);
	}

	@Override
	public MemberVO throwMember(int mem_no) {		
		return memberDao.throwMember(mem_no);
	}

	@Override
	public int mailcheck(MemberVO mvo) {		
		return memberDao.mailcheck(mvo);
	}

	@Override
	public int pwdCheck(MemberVO mvo) {		
		return memberDao.pwdCheck(mvo);
	}

	@Override
	public void memberUpdate(MemberVO mvo) {
		memberDao.memberUpdate(mvo);
		
	}

	@Override
	public int memberOut(MemberVO mvo) {		
		return memberDao.memberOut(mvo);
	}

	@Override
	public MemberVO selectEmail(MemberVO mvo) {		
		return memberDao.selectEmail(mvo);
	}

}
