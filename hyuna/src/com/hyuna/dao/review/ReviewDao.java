package com.hyuna.dao.review;

import java.util.List;

import com.hyuna.vo.board.ReviewVO;

public interface ReviewDao {

	public int reviewInsert(ReviewVO rvo);

	public List<ReviewVO> reviewList(ReviewVO rvo);

	public ReviewVO reviewDetail(ReviewVO rvo);

	public void reviewHit(ReviewVO rvo);

	public int reviewUpdate(ReviewVO rvo);

	

	public void reviewDelete(ReviewVO rvo);

	public int reviewListCnt(ReviewVO rvo);

	
}
