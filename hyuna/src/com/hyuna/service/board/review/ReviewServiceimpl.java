package com.hyuna.service.board.review;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.review.ReviewDao;
import com.hyuna.service.qna.QnaServiceImpl;
import com.hyuna.vo.board.ReviewVO;

@Service
@Transactional
public class ReviewServiceimpl implements ReviewService{
	Logger logger = Logger.getLogger(QnaServiceImpl.class);
	
	@Autowired
	private ReviewDao reviewdao;
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> list = null;
		list = reviewdao.reviewList(rvo);
		return list;
	}

	@Override
	public int reviewInsert(ReviewVO rvo) {
		
		return reviewdao.reviewInsert(rvo);
	}

	@Override
	public void reviewHit(ReviewVO rvo) {
		reviewdao.reviewHit(rvo);
	}
	
}
