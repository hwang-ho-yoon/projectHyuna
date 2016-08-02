package com.hyuna.service.admin;

import java.util.List;

import com.hyuna.vo.AdminVO;
import com.hyuna.vo.MemberVO;
import com.hyuna.vo.Terms_agreeVO;

public interface AdminService {

	public List<MemberVO> memberList(MemberVO mvo);

	public List<Terms_agreeVO> memberDetail(MemberVO mvo);

	public AdminVO adminCheck(AdminVO avo);

	public int memberListCnt(MemberVO mvo);

	public int pwdChange(AdminVO avo);

	public int pwdChange2(AdminVO avo);

	public int memberTotal();

	public int memberToday();

	public int memberYesterday();

	public int memberWeek();

	public int memberMonth();

}
