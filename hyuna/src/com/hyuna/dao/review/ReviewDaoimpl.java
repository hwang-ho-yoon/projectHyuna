package com.hyuna.dao.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.hyuna.vo.board.ReviewVO;
@Repository
public class ReviewDaoimpl implements ReviewDao{
	@Autowired
	private SqlSession session;

	@Override
	public int reviewInsert(ReviewVO rvo) {		
		return session.insert("reviewInsert");
	}

	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {		
		return session.selectList("reviewList");
	}

	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {		
		return session.selectOne("reviewDetail");
	}

	@Override
	public void reviewHit(ReviewVO rvo) {		
		session.update("reviewHit");
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {		
		return session.update("reviewUpdate");
	}

	@Override
	public void reviewDelete(ReviewVO rvo) {
		session.delete("reviewDelete");
		
	}

	@Override
	public int reviewListCnt(ReviewVO rvo) {		
		return session.selectOne("reviewListCnt");
	}

}
