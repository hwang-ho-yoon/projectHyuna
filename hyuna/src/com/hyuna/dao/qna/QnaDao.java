package com.hyuna.dao.qna;

import java.util.List;

import com.hyuna.vo.QnaVO;

public interface QnaDao {

	public int qnaInsert(QnaVO qvo);

	public List<QnaVO> qnaList(QnaVO qvo);

	public QnaVO qnaDetail(QnaVO qvo);

	public void qnaHit(QnaVO qvo);

}
