package com.hyuna.service.cart;

import java.util.List;

import com.hyuna.vo.CartVO;

public interface CartService {
	public List<CartVO> cartList(CartVO cvo);

	public int cartInsert(CartVO cvo);

	public int cartAllDelete(CartVO cvo);

	public int chkDelete(Integer cart_no);
}
