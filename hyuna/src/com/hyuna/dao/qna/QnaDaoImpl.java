package com.hyuna.dao.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyuna.vo.QnaVO;

@Repository
public class QnaDaoImpl implements QnaDao{
	@Autowired
	private SqlSession session;

	@Override
	public int qnaInsert(QnaVO qvo) {		
		return session.insert("qnaInsert");
	}

}
