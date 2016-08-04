package com.hyuna.service.board.review;

import java.util.List;

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
	private ReviewDao reviewDao;
	
	@Override
	public int reviewInsert(ReviewVO rvo) {		
		return reviewDao.reviewInsert(rvo);
	}

	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> list = null;
		list = reviewDao.reviewList(rvo);
		return list;
	}

	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {		
		return reviewDao.reviewDetail(rvo);
	}

	@Override
	public void reviewHit(ReviewVO rvo) {		
		reviewDao.reviewHit(rvo);
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {		
		return reviewDao.reviewUpdate(rvo);
	}

	@Override
	public void reviewDelete(ReviewVO rvo) {
		reviewDao.reviewDelete(rvo);
		
	}

	@Override
	public int reviewListCnt(ReviewVO rvo) {		
		return reviewDao.reviewListCnt(rvo);
	}

	
}
