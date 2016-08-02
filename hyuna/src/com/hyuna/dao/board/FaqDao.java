package com.hyuna.dao.board;

import java.util.List;

import com.hyuna.vo.board.FaqVO;

public interface FaqDao {

	public int faqInsert(FaqVO fvo);

	public List<FaqVO> faqList(FaqVO fvo);

	public int faqListCnt(FaqVO fvo);

	public FaqVO faqDetail(FaqVO fvo);

	public int faqUpdate(FaqVO fvo);

	public int faqDelete(FaqVO fvo);
	
	public int faqHit(FaqVO fvo);

}
