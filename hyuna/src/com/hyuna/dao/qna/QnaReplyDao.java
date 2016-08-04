package com.hyuna.dao.qna;

import java.util.List;

import com.hyuna.vo.QnaReplyVO;

public interface QnaReplyDao {

	public int replyInsert(QnaReplyVO rvo);

	public List<QnaReplyVO> replyList(Integer qna_no);

	public void replyUpdate(QnaReplyVO rvo);

	public void replyDelete(Integer qna_reply_no);

}
