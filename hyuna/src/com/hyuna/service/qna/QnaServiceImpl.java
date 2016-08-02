package com.hyuna.service.qna;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.qna.QnaDao;
import com.hyuna.vo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService{
	Logger logger = Logger.getLogger(QnaServiceImpl.class);

	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public int qnaInsert(QnaVO qvo) {		
		return qnaDao.qnaInsert(qvo);
	}

}
