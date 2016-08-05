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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyuna.service.cart.CartService;
import com.hyuna.service.product.ProductService;
import com.hyuna.vo.CartVO;
import com.hyuna.vo.ProductAllVO;


@Controller
@RequestMapping(value="/cart")
public class CartController {
	Logger logger = Logger.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	// 장바구니로 이동
	@RequestMapping("/cart.do")
	public String cart() {
		logger.info("cart 호출성공");
		return "redirect:/cart/cartList.do";
	}
	
	// 장바구니 목록 구현
		@RequestMapping(value="/cartList.do", method=RequestMethod.GET)
		public String cartList(@ModelAttribute CartVO cvo, Model model,HttpSession session) {
			logger.info("cartList 호출 성공");
			cvo.setMem_no((Integer)session.getAttribute("hyunaMember"));
			
			List<CartVO> cartList = cartService.cartList(cvo);
			
			for (int i = 0; i < cartList.size(); i++) {
				CartVO cartVO = cartList.get(i);
				
				ProductAllVO productAllVO = new ProductAllVO();
				productAllVO.setPrd_d_no(cartVO.getPrd_d_no());
				List<ProductAllVO> productAllVOs = productService.prdAllList(productAllVO);
				if(productAllVOs.size()!=0) {
					cartVO.setColor_detail(productAllVOs.get(0).getColor_detail());
					cartVO.setImg_1(productAllVOs.get(0).getImg_1());
					cartVO.setModel_machine(productAllVOs.get(0).getModel_machine());
					cartVO.setPrd_name(productAllVOs.get(0).getPrd_name());
					cartVO.setPrd_saleprice(productAllVOs.get(0).getPrd_saleprice());
				}
					
			}
			
			/*logger.info("cart : " + cartList.get(0).getPrd_name());*/
			
			model.addAttribute("cartList", cartList);
			
			return "cart/cartList";
		}
	
	//수량변경
	@RequestMapping(value="/updateCount.do", method=RequestMethod.POST)
	public String cartList2(@ModelAttribute CartVO cvo, HttpSession session) {
		logger.info("updateCount 호출 성공");
		cartService.updateCount(cvo);
/*		int result = 0;
		String url="";
		
		cvo.setMem_no((Integer)session.getAttribute("hyunaMember"));
		
		List<CartVO> cartList = cartService.cartList(cvo);
		
		for (int i = 0; i < cartList.size(); i++) {
			CartVO cartVO = cartList.get(i);
			
			ProductAllVO productAllVO = new ProductAllVO();
			productAllVO.setPrd_d_no(cartVO.getPrd_d_no());
			List<ProductAllVO> productAllVOs = productService.prdAllList(productAllVO);
			
			cartVO.setMem_no(cartVO.getMem_no());
			
			
			cartVO.setColor_detail(productAllVOs.get(0).getColor_detail());
			cartVO.setImg_1(productAllVOs.get(0).getImg_1());
			cartVO.setModel_machine(productAllVOs.get(0).getModel_machine());
			cartVO.setPrd_name(productAllVOs.get(0).getPrd_name());
			cartVO.setPrd_saleprice(productAllVOs.get(0).getPrd_saleprice());
			
			
			if(result==1) {
				url = "/cart/updateCount.do";
				//url = "/cart/cartList.do?cart_no=" + cvo.getCart_quantity();
			}
		}*/
		
		/*logger.info("cart : " + cartList.get(0).getPrd_name());*/
		
//		model.addAttribute("cartList", cartList);
		
		return "redirect:" + "/cart/cartList.do";
	}
		
	// 장바구니 등록
	@RequestMapping(value="/cartInsert", method=RequestMethod.POST)
	public String cartInsert(@ModelAttribute CartVO cvo, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("cartInsert 호출 성공");
		
		/*CartVO cvo = new CartVO();
		cvo.setCart_quantity(1);
		cvo.setPrd_d_no(1);0
		cvo.setMem_no(2222);*/
		
		/*cvo.setCart_quantity(3);
		cvo.setPrd_d_no(3);
		cvo.setMem_no(1234);*/
		
		int result = 0;
		String url = "";
		
		/*int detailNo=cartService.optDetailNo(cvo);
		cvo.setPrd_d_no(detailNo);*/
		
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
		logger.info("result :  " + result);
		if(result > 0) {
			printResult="SUCCESS";
		}
		return printResult;
	}
	
	@RequestMapping(value="/chkDelete.do")
	public String chkDelete(@RequestParam("select") int[] cart_no, HttpSession session) {
		for (int i = 0; i < cart_no.length; i++) {
			CartVO cartVO = new CartVO();
			cartVO.setMem_no((int)session.getAttribute("hyunaMember"));
			cartVO.setCart_no(cart_no[i]);
			cartService.chkDelete(cartVO);
		}
		return "redirect:" + "/cart/cartList.do";
	}
	
	
	
	// 전체주문
	@ResponseBody
	@RequestMapping(value="/orderWrite.do")
	public String cartAllOrder(HttpSession session) throws IOException {
		logger.info("cartAllOrder 호출 성공");
		
		CartVO cvo = new CartVO();
		
		int result = 0;
		String printResult ="";
		
		cvo.setMem_no((Integer)session.getAttribute("hyunaMember"));
		logger.info("cvo.getMem_no() : "+cvo.getMem_no());
		result = cartService.cartAllOrder(cvo);
		logger.info("result : " + result);
		if(result > 0) {
			printResult="SUCCESS";
		}
		return printResult;
	}	
}
