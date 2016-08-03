package com.hyuna.service.qna;

import java.util.List;

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

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> list = null;
		list = qnaDao.qnaList(qvo);
		return list;
	}

	@Override
	public QnaVO qnaDetail(QnaVO qvo) {		
		return qnaDao.qnaDetail(qvo);
	}

	@Override
	public void qnaHit(QnaVO qvo) {		
		qnaDao.qnaHit(qvo);
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {		
		return qnaDao.qnaUpdate(qvo);
	}

	@Override
	public void qnaDelete(QnaVO qvo) {
		qnaDao.qnaDelete(qvo);
		
	}

	@Override
	public int qnaListCnt(QnaVO qvo) {		
		return qnaDao.qnaListCnt(qvo);
	}

}
