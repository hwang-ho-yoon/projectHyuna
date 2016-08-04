package com.hyuna.service.board.review;

import java.util.List;

import com.hyuna.vo.board.ReviewVO;

public interface ReviewService {

	public int reviewListCnt(ReviewVO rvo);

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public int reviewInsert(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

	public void reviewHit(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);

	public void reviewDelete(ReviewVO rvo);

	

	
}
