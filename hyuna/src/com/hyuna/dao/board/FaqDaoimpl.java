package com.hyuna.dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyuna.vo.board.FaqVO;

@Repository
public class FaqDaoimpl implements FaqDao{
	@Autowired
	private SqlSession session;
	
	
	
	
	@Override
	public int faqInsert(FaqVO fvo) {
		return session.insert("faqInsert",fvo);
	}




	@Override
	public List<FaqVO> faqList(FaqVO fvo) {
		return session.selectList("faqList");
	}




	@Override
	public int faqListCnt(FaqVO fvo) {
		return (Integer)session.selectOne("faqListCnt");
	}




	@Override
	public FaqVO faqDetail(FaqVO fvo) {
		return session.selectOne("faqDetail", fvo);
	}




	@Override
	public int faqUpdate(FaqVO fvo) {
		return (Integer)session.update("faqUpdate", fvo);
	}




	@Override
	public int faqDelete(FaqVO fvo) {
		// TODO Auto-generated method stub
		return (Integer)session.delete("faqDelete", fvo);
	}




	@Override
	public int faqHit(FaqVO fvo) {
		// TODO Auto-generated method stub
		return session.update("faqHit",fvo);
	}
	
	
	
}
