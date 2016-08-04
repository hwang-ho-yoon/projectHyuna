package com.hyuna.service.qna;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.qna.QnaReplyDao;
import com.hyuna.vo.QnaReplyVO;

@Service
@Transactional
public class QnaReplyServiceImpl implements QnaReplyService{

	Logger logger = Logger.getLogger(QnaReplyServiceImpl.class);
	
	@Autowired
	private QnaReplyDao qnaReplyDao;
	
	public int replyInsert(QnaReplyVO rvo) {
		int result = 0;
		result = qnaReplyDao.replyInsert(rvo);
		return result;
	}

	@Override
	public List<QnaReplyVO> replyList(Integer qna_no) {
		List<QnaReplyVO> list = null;
		list = qnaReplyDao.replyList(qna_no);
		return list;
	}

	@Override
	public void replyUpdate(QnaReplyVO rvo) {
		qnaReplyDao.replyUpdate(rvo);
		
	}

	@Override
	public void replyDelete(Integer qna_reply_no) {
		qnaReplyDao.replyDelete(qna_reply_no);
		
	}

}
