package com.hyuna.service.board.review;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.review.ReviewDao;
import com.hyuna.vo.board.ReviewVO;

@Service
@Transactional
public class ReviewServiceimpl implements ReviewService{
	
	Logger logger = Logger.getLogger(ReviewServiceimpl.class);
	
	@Autowired
	private ReviewDao reviewdao;
	
	@Override
	public int reviewInsert(ReviewVO rvo) {
		return reviewdao.reviewInsert(rvo);
	}

}
