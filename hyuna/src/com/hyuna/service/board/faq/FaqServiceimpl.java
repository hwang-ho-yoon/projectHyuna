package com.hyuna.service.board.faq;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.board.FaqDao;
import com.hyuna.vo.board.FaqVO;



@Service
@Transactional
public class FaqServiceimpl implements FaqService{
	Logger logger = Logger.getLogger(FaqServiceimpl.class);
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public int faqInsert(FaqVO fvo) {
		return faqDao.faqInsert(fvo);
	}

	@Override
	public List<FaqVO> faqList(FaqVO fvo) {
		List<FaqVO> myList = null;
		myList = faqDao.faqList(fvo);
		return myList;
	}

	@Override
	public int faqListCnt(FaqVO fvo) {
		return faqDao.faqListCnt(fvo);
	}

	@Override
	public FaqVO FaqDetail(FaqVO fvo) {
		
		return faqDao.faqDetail(fvo);
	}

	@Override
	public int faqUpdate(FaqVO fvo) {
		return faqDao.faqUpdate(fvo);
	}

	@Override
	public int faqDelete(FaqVO fvo) {
		return faqDao.faqDelete(fvo);
	}

	@Override
	public int faqHit(FaqVO fvo) {
		return faqDao.faqHit(fvo);
		
	}
}
