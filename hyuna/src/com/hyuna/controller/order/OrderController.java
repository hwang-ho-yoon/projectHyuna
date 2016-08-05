package com.hyuna.controller.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyuna.common.page.Paging;
import com.hyuna.service.member.MemberService;
import com.hyuna.service.order.OrderService;
import com.hyuna.service.product.ProductService;
import com.hyuna.util.OrderState;
import com.hyuna.vo.MemberVO;
import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderProductVO;
import com.hyuna.vo.OrderRecallCancelVO;
import com.hyuna.vo.OrderVO;
import com.hyuna.vo.ProductAllVO;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	Logger logger = Logger.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductService productService; 
	
	@RequestMapping("/orderWrite.do")
	public String orderWrite(@RequestParam("prd_d_no") int[] prd_d_nos, @RequestParam("quantity") int[] quantitys, Model model, HttpSession session) {
		int mem_no = (int)session.getAttribute("hyunaMember");
		MemberVO memberVO = memberService.throwMember(mem_no);
		List<ProductAllVO> productAllVOs = new ArrayList<ProductAllVO>();
		for (int i = 0; i < prd_d_nos.length; i++) {
			ProductAllVO productAllVO = new ProductAllVO();
			productAllVO.setPrd_d_no(prd_d_nos[i]);
			List<ProductAllVO> allVOs = productService.prdAllList(productAllVO);
			if (allVOs.size() != 0) {
				ProductAllVO allVO = allVOs.get(0);
				allVO.setPrd_d_stock(String.valueOf(quantitys[i]));
				productAllVOs.add(allVO);
			}
		}
		model.addAttribute("member", memberVO);
		model.addAttribute("productAllVO", productAllVOs);
		return "order/orderWrite";
	}
	
	@RequestMapping("/orderList.do")
	public String orderList(@ModelAttribute OrderVO orderVO, Model model, HttpSession session) {
		int mem_no = (int)session.getAttribute("hyunaMember");
		
		/*정렬에 대한 기본값 설정*/
		if(orderVO.getOrder_by() == null) {
			orderVO.setOrder_by("ogr_no");
		}
		if(orderVO.getOrder_sc() == null) {
			orderVO.setOrder_sc("DESC");
		}
		
		Paging.setPage(orderVO);
		//전체 레코드 수 구현
		orderVO.setMem_no(mem_no);
		orderVO.setOgr_state1(OrderState.STANDBY_DEPOSIT);
		orderVO.setOgr_state2(OrderState.COMPLETE_DEPOSIT);
		orderVO.setOgr_state3(OrderState.STANDBY_SHIPPING);
		orderVO.setOgr_state4(OrderState.COMPLETE_SHIPPED);
		int total = orderService.orderListCnt(orderVO);
		
		List<OrderGroupVO> orderGroupsVOs = orderService.selectOrderGroups(orderVO);
		for (int i = 0; i < orderGroupsVOs.size(); i++) {
			OrderGroupVO orderGroupsVO = orderGroupsVOs.get(i);
			List<OrderProductVO> orderProductVOs = orderService.selectOrderProducts(orderGroupsVO.getOgr_no());
			for (int j = 0; j < orderProductVOs.size(); j++) {
				ProductAllVO productAllVO = new ProductAllVO();
				productAllVO.setPrd_d_no(orderProductVOs.get(j).getPrd_d_no());
				List<ProductAllVO> productAllVOs = productService.prdAllList(productAllVO);
				orderProductVOs.get(j).setPrd_name(productAllVOs.get(0).getPrd_name());
				orderProductVOs.get(j).setModel_machine(productAllVOs.get(0).getModel_machine());
				orderProductVOs.get(j).setPrd_saleprice(productAllVOs.get(0).getPrd_saleprice());
				orderProductVOs.get(j).setColor_detail(productAllVOs.get(0).getColor_detail());
			}
 			orderGroupsVO.setOrderProductVO(orderProductVOs);
		}
		model.addAttribute("orderGroups", orderGroupsVOs);
		model.addAttribute("data", orderVO);
		model.addAttribute("total", total);
		return "order/orderList";
	}
	
	@RequestMapping("/orderListRnc.do")
	public String orderListRnc(Model model, HttpSession session) {
		int mem_no = (int)session.getAttribute("hyunaMember");
		OrderVO orderVO = new OrderVO();
		Paging.setPage(orderVO);
		orderVO.setMem_no(mem_no);
		orderVO.setOgr_state1(OrderState.STANDBY_CANCEL);
		orderVO.setOgr_state2(OrderState.COMPLETE_CANCEL);
		orderVO.setOgr_state3(OrderState.STANDBY_RECALL);
		orderVO.setOgr_state4(OrderState.COMPLETE_RECALL);
		List<OrderGroupVO> orderGroupsVOs = orderService.selectOrderGroupsNoPage(orderVO);
		for (int i = 0; i < orderGroupsVOs.size(); i++) {
			OrderGroupVO orderGroupsVO = orderGroupsVOs.get(i);
			List<OrderProductVO> orderProductVOs = orderService.selectOrderProducts(orderGroupsVO.getOgr_no());
			for (int j = 0; j < orderProductVOs.size(); j++) {
				ProductAllVO productAllVO = new ProductAllVO();
				productAllVO.setPrd_d_no(orderProductVOs.get(j).getPrd_d_no());
				List<ProductAllVO> productAllVOs = productService.prdAllList(productAllVO);
				orderProductVOs.get(j).setPrd_name(productAllVOs.get(0).getPrd_name());
				orderProductVOs.get(j).setModel_machine(productAllVOs.get(0).getModel_machine());
				orderProductVOs.get(j).setPrd_saleprice(productAllVOs.get(0).getPrd_saleprice());
				orderProductVOs.get(j).setColor_detail(productAllVOs.get(0).getColor_detail());
			}
 			orderGroupsVO.setOrderProductVO(orderProductVOs);
		}
		model.addAttribute("orderGroups", orderGroupsVOs);
		model.addAttribute("data", orderVO);
		return "order/orderListRnc";
	}
	
	@RequestMapping(value = "/all/{group_no}.do")
	@ResponseBody
	public OrderRecallCancelVO orderRncDetail(@PathVariable("group_no") int group_no) {
		OrderRecallCancelVO orderRecallCancelVO = orderService.selectOrderRecallCancel(group_no);
		return orderRecallCancelVO;
	}
	
	@RequestMapping("/orderDetail.do")
	public String orderDetail(@RequestParam("ogr_no") String ogr_no, Model model) {
		OrderGroupVO ogv = orderService.orderGroupDetail(ogr_no);
		List<OrderProductVO> orderProductVOs = orderService.selectOrderProducts(ogv.getOgr_no());
		ogv.setOrderProductVO(orderProductVOs);
		List<ProductAllVO> productAllVOs = new ArrayList<ProductAllVO>();
		for (int i = 0; i < ogv.getOrderProductVO().size(); i++) {
			ProductAllVO productAllVO = new ProductAllVO();
			productAllVO.setPrd_d_no(ogv.getOrderProductVO().get(i).getPrd_d_no());
			List<ProductAllVO> allVOs = productService.prdAllList(productAllVO);
			if (allVOs.size() != 0) {
				ProductAllVO allVO = allVOs.get(0);
				allVO.setPrd_d_stock(String.valueOf(ogv.getOrderProductVO().get(i).getOrd_amount()));
				productAllVOs.add(allVO);
			}
		}
		
		model.addAttribute("orderGroup", ogv);
		model.addAttribute("productAllVO", productAllVOs);
		return "order/orderDetail";
	}
	
	@RequestMapping("/orderDetailRnc.do")
	public String orderDetailRnc(@RequestParam("ogr_no") String ogr_no, Model model) {
		OrderGroupVO ogv = orderService.orderGroupDetail(ogr_no);
		List<OrderProductVO> orderProductVOs = orderService.selectOrderProducts(ogv.getOgr_no());
		ogv.setOrderProductVO(orderProductVOs);
		List<ProductAllVO> productAllVOs = new ArrayList<ProductAllVO>();
		for (int i = 0; i < ogv.getOrderProductVO().size(); i++) {
			ProductAllVO productAllVO = new ProductAllVO();
			productAllVO.setPrd_d_no(ogv.getOrderProductVO().get(i).getPrd_d_no());
			List<ProductAllVO> allVOs = productService.prdAllList(productAllVO);
			if (allVOs.size() != 0) {
				ProductAllVO allVO = allVOs.get(0);
				allVO.setPrd_d_stock(String.valueOf(ogv.getOrderProductVO().get(i).getOrd_amount()));
				productAllVOs.add(allVO);
			}
		}
		
		model.addAttribute("orderGroup", ogv);
		model.addAttribute("productAllVO", productAllVOs);
		return "order/orderDetailRnc";
	}
	
	@RequestMapping("/orderCancel.do")
	public String orderCancel(@ModelAttribute OrderRecallCancelVO recallCancel) {
		logger.info("주문취소 호출");
		recallCancel.setRnc_gbn(OrderState.STANDBY_CANCEL);
		orderService.orderGroupUpdate(recallCancel);
		orderService.orderCancelRecallInsert(recallCancel);
		return "redirect:"+"/order/orderList.do?ogr_no="+recallCancel.getOgr_no()+"&page="+recallCancel.getPage()+"&pageSize=" + recallCancel.getPageSize() +  "&keyword=" + recallCancel.getKeyword() + "&keyword1="+ recallCancel.getKeyword1();
	}
	
	@RequestMapping("/orderRecall.do")
	public String orderRecall(@ModelAttribute OrderRecallCancelVO recallCancel) {
		logger.info("주문반품 호출");
		recallCancel.setRnc_gbn(OrderState.STANDBY_RECALL);
		orderService.orderGroupUpdate(recallCancel);
		orderService.orderCancelRecallInsert(recallCancel);
		return "redirect:"+"/order/orderList.do?ogr_no="+recallCancel.getOgr_no()+"&page="+recallCancel.getPage()+"&pageSize=" + recallCancel.getPageSize() +  "&keyword=" + recallCancel.getKeyword() + "&keyword1="+ recallCancel.getKeyword1();
	}
	
	@RequestMapping("/orderInsert.do")
	public String orderInsert(@ModelAttribute OrderGroupVO ogv) {
		logger.info("주문등록 호출");
		if (ogv.getOgr_payPlan().equals("mutongjang")) {
			ogv.setOgr_state(OrderState.STANDBY_DEPOSIT);
			ogv.setOgr_approvalNo("");
		} else if (ogv.getOgr_payPlan().equals("card")) {
			ogv.setOgr_state(OrderState.COMPLETE_DEPOSIT);
			ogv.setOgr_approvalNo(ogv.getOgr_cardNo());
		}
		int result = orderService.orderGroupInsert(ogv);
		result = orderService.orderProductInsert(ogv);
		result = orderService.orderInsertProductAmount(ogv);
		String url = "";
		if (result == 1) {
			url = "/order/orderDetail.do?ogr_no="+ogv.getOgr_no()+"&page=1&pageSize=5";
		} else {
			url = "/order/orderWrite.do";
		}
		return "redirect:"+url;
	}
}
