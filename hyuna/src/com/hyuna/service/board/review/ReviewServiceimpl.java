package com.hyuna.service.board.review;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.vo.board.ReviewVO;

@Service
@Transactional
public class ReviewServiceimpl implements ReviewService{

	@Override
	public int reviewInsert(ReviewVO rvo) {
		
		return 0;
	}

}
