package com.hyuna.service.cart;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.cart.CartDao;
import com.hyuna.vo.CartVO;

@Service
@Transactional
public class CartServiceImpl implements CartService {
	Logger logger = Logger.getLogger(CartServiceImpl.class);
	
	@Autowired
	private CartDao cartDao;

	// 장바구니 목록 구현
	@Override
	public List<CartVO> cartList(CartVO cvo) {
		List<CartVO> list = null;
		list = cartDao.cartList(cvo);
		return list;
	}

	// 장바구니 등록
	@Override
	public int cartInsert(CartVO cvo) {
		int result = 0;
		result = cartDao.cartInsert(cvo);
		return result;
	}

	// 장바구니 전체 삭제
	@Override
	public int cartAllDelete(CartVO cvo) {
		int result = 0;
		result = cartDao.cartAllDelete(cvo);
		return result;
	}

	// 장바구니 선택 삭제
	@Override
	public int chkDelete(Integer cart_no) {
		int result = 0;
		result = cartDao.chkDelete(cart_no);
		return result;
		
	}

	@Override
	public int optDetailNo(CartVO cvo) {
		// TODO Auto-generated method stub
		return cartDao.optDetailNo(cvo);
	}

	// 수량변경
	@Override
	public int updateCount(CartVO cvo) {
		int result = 0;
		result = cartDao.updateCount(cvo);
		return result;
	}

	// 전체 주문
	@Override
	public int cartAllOrder(CartVO cvo) {
		int result = 0;
		result = cartDao.cartAllOrder(cvo);
		return result;
	}
	
}
