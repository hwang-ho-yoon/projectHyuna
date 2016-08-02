package com.hyuna.dao.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hyuna.vo.board.ReviewVO;

public class ReviewDaoimpl implements ReviewDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int reviewInsert(ReviewVO rvo) {
		return session.insert("reviewInsert");
	}

}
