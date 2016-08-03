package com.hyuna.controller.order;

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

import com.hyuna.service.member.MemberService;
import com.hyuna.service.order.OrderService;
import com.hyuna.util.OrderState;
import com.hyuna.vo.MemberVO;
import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderRecallCancelVO;
import com.hyuna.vo.OrderVO;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	Logger logger = Logger.getLogger(OrderController.class);
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/orderWrite.do")
	public String orderWrite(Model model, HttpSession session) {
		int mem_no = (int)session.getAttribute("hyunaMember");
		MemberVO memberVO = memberService.throwMember(mem_no);
		model.addAttribute("member", memberVO);
		return "order/orderWrite";
	}
	
	@RequestMapping("/orderList.do")
	public String orderList(Model model, HttpSession session) {
		int mem_no = (int)session.getAttribute("hyunaMember");
		OrderVO orderVO = new OrderVO();
		orderVO.setMem_no(mem_no);
		orderVO.setOgr_state1(OrderState.STANDBY_DEPOSIT);
		orderVO.setOgr_state2(OrderState.COMPLETE_DEPOSIT);
		orderVO.setOgr_state3(OrderState.STANDBY_SHIPPING);
		orderVO.setOgr_state4(OrderState.COMPLETE_SHIPPED);
		List<OrderGroupVO> orderGroupsVOs = orderService.selectOrderGroups(orderVO);
		for (int i = 0; i < orderGroupsVOs.size(); i++) {
			OrderGroupVO orderGroupsVO = orderGroupsVOs.get(i);
			orderGroupsVO.setOrderProductVO(orderService.selectOrderProducts(orderGroupsVO.getOgr_no()));
		}
		model.addAttribute("orderGroups", orderGroupsVOs);
		return "order/orderList";
	}
	
	@RequestMapping("/orderListRnc.do")
	public String orderListRnc(Model model, HttpSession session) {
		int mem_no = (int)session.getAttribute("hyunaMember");
		OrderVO orderVO = new OrderVO();
		orderVO.setMem_no(mem_no);
		orderVO.setOgr_state1(OrderState.STANDBY_CANCEL);
		orderVO.setOgr_state2(OrderState.COMPLETE_CANCEL);
		orderVO.setOgr_state3(OrderState.STANDBY_RECALL);
		orderVO.setOgr_state4(OrderState.COMPLETE_RECALL);
		List<OrderGroupVO> orderGroupsVOs = orderService.selectOrderGroups(orderVO);
		for (int i = 0; i < orderGroupsVOs.size(); i++) {
			OrderGroupVO orderGroupsVO = orderGroupsVOs.get(i);
			orderGroupsVO.setOrderProductVO(orderService.selectOrderProducts(orderGroupsVO.getOgr_no()));
		}
		model.addAttribute("orderGroups", orderGroupsVOs);
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
		model.addAttribute("orderGroup", ogv);
		return "order/orderDetail";
	}
	
	@RequestMapping("/orderCancel.do")
	public String orderCancel(@ModelAttribute OrderRecallCancelVO recallCancel) {
		logger.info("주문취소 호출");
		recallCancel.setRnc_gbn(OrderState.STANDBY_CANCEL);
		orderService.orderGroupUpdate(recallCancel);
		orderService.orderCancelRecallInsert(recallCancel);
		return "redirect:"+"/order/orderList.do";
	}
	
	@RequestMapping("/orderRecall.do")
	public String orderRecall(@ModelAttribute OrderRecallCancelVO recallCancel) {
		logger.info("주문반품 호출");
		recallCancel.setRnc_gbn(OrderState.STANDBY_RECALL);
		orderService.orderGroupUpdate(recallCancel);
		orderService.orderCancelRecallInsert(recallCancel);
		return "redirect:"+"/order/orderList.do";
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
		String url = "";
		if (result == 1) {
			url = "/order/orderDetail.do?ogr_no="+ogv.getOgr_no();
		} else {
			url = "/order/orderWrite.do";
		}
		return "redirect:"+url;
	}
}
