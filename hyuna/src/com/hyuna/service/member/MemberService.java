package com.hyuna.service.member;

import java.util.List;

import com.hyuna.vo.MemberVO;
import com.hyuna.vo.TermsVO;
import com.hyuna.vo.Terms_agreeVO;

public interface MemberService {

	public int memberInsert(MemberVO mvo);

	public int idCheck(MemberVO mvo);

	public List<TermsVO> termsList();

	public MemberVO findidOk(MemberVO mvo);

	public MemberVO memberSelect(MemberVO mvo);

	public int agreeInsert(Terms_agreeVO tv);

	public MemberVO loginCheck(MemberVO mvo);

	public int memberPw(MemberVO mvo);
	
	public MemberVO throwMember(int mem_no);

	public int mailcheck(MemberVO mvo);

	public int pwdCheck(MemberVO mvo);

	public void memberUpdate(MemberVO mvo);

	public int memberOut(MemberVO mvo);

	public MemberVO selectEmail(MemberVO mvo);

}
