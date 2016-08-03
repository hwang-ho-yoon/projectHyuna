package com.hyuna.dao.review;

import java.util.List;

import com.hyuna.vo.board.ReviewVO;

public interface ReviewDao {

	List<ReviewVO> reviewList(ReviewVO rvo);

	int reviewInsert(ReviewVO rvo);

	void reviewHit(ReviewVO rvo);

}
