package com.hyuna.service.board.review;

import java.util.List;

import com.hyuna.vo.board.ReviewVO;

public interface ReviewService {

	List<ReviewVO> reviewList(ReviewVO rvo);

	int reviewInsert(ReviewVO rvo);

	void reviewHit(ReviewVO rvo);
	
	
}
