package com.hyuna.dao.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyuna.vo.CartVO;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSession session;
	
	// 장바구니 목록 구현
	@Override
	public List<CartVO> cartList(CartVO cvo) {
		return session.selectList("cartList");
	}

	// 장바구니 등록
	@Override
	public int cartInsert(CartVO cvo) {
		return session.insert("cartInsert");
	}

	// 장바구니 삭제
	@Override
	public int cartAllDelete(CartVO cvo) {
		return session.delete("cartDelete");
	}

	@Override
	public int chkDelete(CartVO cvo) {
		// TODO Auto-generated method stub
		return session.delete("chkDelete");
	}

	@Override
	public int optDetailNo(CartVO cvo) {
		// TODO Auto-generated method stub
		return session.selectOne("optDetailNo");
	}

	// 수량변경
	@Override
	public int updateCount(CartVO cvo) {
		// TODO Auto-generated method stub
		return session.update("updateCount");
	}

	// 전체주문
	@Override
	public int cartAllOrder(CartVO cvo) {
		// TODO Auto-generated method stub
		return session.selectOne("cartAllOrder");
	}	
}
