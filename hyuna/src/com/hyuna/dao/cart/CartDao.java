package com.hyuna.dao.cart;

import java.util.List;

import com.hyuna.vo.CartVO;

public interface CartDao {
	public List<CartVO> cartList(CartVO cvo);
	public int cartInsert(CartVO cvo);
	public int cartAllDelete(CartVO cvo);
	public int chkDelete(Integer cart_no);
	public int optDetailNo(CartVO cvo);
	public int updateCount(CartVO cvo);
	public int cartAllOrder(CartVO cvo);
}
