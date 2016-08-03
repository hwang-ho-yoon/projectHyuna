package com.hyuna.dao.qna;

import java.util.List;

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

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {		
		return session.selectList("qnaList");
	}

	@Override
	public QnaVO qnaDetail(QnaVO qvo) {		
		return session.selectOne("qnaDetail");
	}

	@Override
	public void qnaHit(QnaVO qvo) {		
		session.update("qnaHit");
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {		
		return session.update("qnaUpdate");
	}

	@Override
	public void qnaDelete(QnaVO qvo) {
		session.delete("qnaDelete");
		
	}

	@Override
	public int qnaListCnt(QnaVO qvo) {		
		return session.selectOne("qnaListCnt");
	}

}
