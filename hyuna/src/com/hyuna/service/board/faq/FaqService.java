package com.hyuna.service.board.faq;

import java.util.List;

import com.hyuna.vo.board.FaqVO;

public interface FaqService {

public int faqInsert(FaqVO fvo);

public int faqListCnt(FaqVO fvo);

public List<FaqVO> faqList(FaqVO fvo);

public FaqVO FaqDetail(FaqVO fvo);

public int faqUpdate(FaqVO fvo);

public int faqDelete(FaqVO bvo);

public int faqHit(FaqVO fvo);
}
