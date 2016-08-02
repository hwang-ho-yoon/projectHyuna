package com.hyuna.service.qna;

import java.util.List;

import com.hyuna.vo.QnaVO;

public interface QnaService {

	public int qnaInsert(QnaVO qvo);

	public List<QnaVO> qnaList(QnaVO qvo);

	public QnaVO qnaDetail(QnaVO qvo);

	public void qnaHit(QnaVO qvo);

}
