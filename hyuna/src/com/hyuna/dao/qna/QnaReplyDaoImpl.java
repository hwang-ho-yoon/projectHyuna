package com.hyuna.dao.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hyuna.vo.QnaReplyVO;

public class QnaReplyDaoImpl implements QnaReplyDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public int replyInsert(QnaReplyVO rvo) {		
		return session.insert("replyInsert");
	}

	@Override
	public List<QnaReplyVO> replyList(Integer qna_no) {		
		return session.selectList("replyList");
	}

	@Override
	public void replyUpdate(QnaReplyVO rvo) {
		session.update("replyUpdate");
		
	}

	@Override
	public void replyDelete(Integer qna_reply_no) {
		session.delete("replyDelete");
		
	}

}
