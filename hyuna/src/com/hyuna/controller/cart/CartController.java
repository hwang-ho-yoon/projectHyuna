package com.hyuna.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyuna.service.cart.CartService;
import com.hyuna.vo.CartVO;


@Controller
@RequestMapping(value="/cart")
public class CartController {
	Logger logger = Logger.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	// 장바구니로 이동
	@RequestMapping("/cart.do")
	public String cart() {
		logger.info("cart 호출성공");
		return "cart/cartList";
	}
	
	// 장바구니 목록 구현
	@RequestMapping(value="/cartList.do", method=RequestMethod.GET)
	public String cartList(@ModelAttribute CartVO cvo, Model model,HttpSession session) {
		logger.info("cartList 호출 성공");
		cvo.setMem_no((Integer)session.getAttribute("hyunaMember"));
		
		List<CartVO> cartList = cartService.cartList(cvo);
		
		/*logger.info("cart : " + cartList.get(0).getPrd_name());*/
		
		model.addAttribute("cartList", cartList);
		
		return "cart/cartList";
	}
		
	// 장바구니 등록
	@RequestMapping(value="/cartInsert", method=RequestMethod.GET)
	public String cartInsert(@ModelAttribute CartVO cvo, HttpSession session/*, HttpServletRequest request*/) throws IllegalStateException, IOException {
		logger.info("cartInsert 호출 성공");
		
		/*CartVO cvo = new CartVO();
		cvo.setCart_quantity(1);
		cvo.setPrd_d_no(1);
		cvo.setMem_no(2222);*/
		
		/*cvo.setCart_quantity(3);
		cvo.setPrd_d_no(3);
		cvo.setMem_no(1234);*/
		
		int result = 0;
		String url = "";
		cvo.setMem_no((Integer)session.getAttribute("hyunaMember"));
		result = cartService.cartInsert(cvo);
		if(result == 1) {
			url = "/cart/cartList.do";
		}
				
		return "redirect:" + url;
	}
	
	// 장바구니 비우기
	@ResponseBody
	@RequestMapping(value="/cartDelete.do")
	public String cartChkDelete(HttpSession session) throws IOException {
		logger.info("cartDelete 호출 성공");
		
		CartVO cvo = new CartVO();
		
		int result = 0;
		String printResult ="";
		cvo.setMem_no((Integer)session.getAttribute("hyunaMember"));
		logger.info("cvo.getMem_no() : "+cvo.getMem_no());
		result = cartService.cartAllDelete(cvo);
		logger.info("result : " + result);
		if(result > 0) {
			printResult="SUCCESS";
		}
		return printResult;
	}
	
	// 선택삭제
	/*@RequestMapping(value="{cart_no}.do", method=RequestMethod.DELETE)
	public ResponseEntity<String> chkDelete(@PathVariable("cart_no") Integer cart_no) {
		logger.info("chkDelte 호출 성공");
		ResponseEntity<String> entity = null;
		
		try {
			cartService.chkDelete(cart_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}*/
}
