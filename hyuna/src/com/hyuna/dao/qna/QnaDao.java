package com.hyuna.dao.qna;

import java.util.List;

import com.hyuna.vo.QnaVO;

public interface QnaDao {

	public int qnaInsert(QnaVO qvo);

	public List<QnaVO> qnaList(QnaVO qvo);

	public QnaVO qnaDetail(QnaVO qvo);

	public void qnaHit(QnaVO qvo);

	public int qnaUpdate(QnaVO qvo);

	public void qnaDelete(QnaVO qvo);

	public int qnaListCnt(QnaVO qvo);

	public List<QnaVO> qnaList1(QnaVO qvo);

	public int qnaInsert1(QnaVO qvo);

}
