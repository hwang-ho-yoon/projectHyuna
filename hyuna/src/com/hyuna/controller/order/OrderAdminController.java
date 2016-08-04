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
import com.hyuna.service.order.OrderAdminService;
import com.hyuna.util.OrderState;
import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderRecallCancelVO;
import com.hyuna.vo.OrderVO;

@Controller
@RequestMapping(value="/orderAdmin")
public class OrderAdminController {
	
	Logger logger = Logger.getLogger(OrderAdminController.class);
	@Autowired
	private OrderAdminService orderAdminService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/orderAdminListApproval.do")
	public String orderAdminListApproval(@ModelAttribute OrderGroupVO orderGroupVO, HttpSession session) {
		orderGroupVO.setOgr_state(OrderState.COMPLETE_DEPOSIT);
		orderAdminService.updateApproval(orderGroupVO);
		return "redirect:/orderAdmin/orderAdminList.do";
	}
	
	@RequestMapping("/orderAdminListDelivery.do")
	public String orderAdminListDelivery(@ModelAttribute OrderGroupVO orderGroupVO, HttpSession session) {
		orderGroupVO.setOgr_state(OrderState.STANDBY_SHIPPING);
		orderAdminService.updateDelivery(orderGroupVO);
		return "redirect:/orderAdmin/orderAdminList.do";
	}
	
	@RequestMapping("/orderAdminList.do")
	public String orderAdminList(Model model, HttpSession session) {
		OrderVO orderVO = new OrderVO();
		orderVO.setOgr_state1(OrderState.STANDBY_DEPOSIT);
		orderVO.setOgr_state2(OrderState.COMPLETE_DEPOSIT);
		orderVO.setOgr_state3(OrderState.STANDBY_SHIPPING);
		orderVO.setOgr_state4(OrderState.COMPLETE_SHIPPED);
		List<OrderGroupVO> orderGroupsVOs = orderAdminService.selectOrderGroups(orderVO);
		for (int i = 0; i < orderGroupsVOs.size(); i++) {
			OrderGroupVO orderGroupsVO = orderGroupsVOs.get(i);
			orderGroupsVO.setOrderProductVO(orderAdminService.selectOrderProducts(orderGroupsVO.getOgr_no()));
			orderGroupsVO.setMem_id((memberService.throwMember(orderGroupsVO.getMem_no())).getMem_id());
		}
		model.addAttribute("orderGroups", orderGroupsVOs);
		return "orderAdmin/orderAdminList";
	}
	
	@RequestMapping("/orderAdminListRnc.do")
	public String orderAdminListRnc(Model model, HttpSession session) {
		OrderVO orderVO = new OrderVO();
		orderVO.setOgr_state1(OrderState.STANDBY_CANCEL);
		orderVO.setOgr_state2(OrderState.COMPLETE_CANCEL);
		orderVO.setOgr_state3(OrderState.STANDBY_RECALL);
		orderVO.setOgr_state4(OrderState.COMPLETE_RECALL);
		List<OrderGroupVO> orderGroupsVOs = orderAdminService.selectOrderGroups(orderVO);
		for (int i = 0; i < orderGroupsVOs.size(); i++) {
			OrderGroupVO orderGroupsVO = orderGroupsVOs.get(i);
			orderGroupsVO.setOrderProductVO(orderAdminService.selectOrderProducts(orderGroupsVO.getOgr_no()));
			orderGroupsVO.setMem_id((memberService.throwMember(orderGroupsVO.getMem_no())).getMem_id());
		}
		model.addAttribute("orderGroups", orderGroupsVOs);
		return "orderAdmin/orderAdminListRnc";
	}
	
	@RequestMapping(value = "/all/{group_no}.do")
	@ResponseBody
	public OrderRecallCancelVO orderAdminRncDetail(@PathVariable("group_no") int group_no) {
		OrderRecallCancelVO orderRecallCancelVO = orderAdminService.selectOrderRecallCancel(group_no);
		return orderRecallCancelVO;
	}

	@RequestMapping("/orderAdminDetail.do")
	public String orderAdminDetail(@RequestParam("ogr_no") String ogr_no, Model model) {
		OrderGroupVO ogv = orderAdminService.orderGroupDetail(ogr_no);
		model.addAttribute("orderGroup", ogv);
		return "orderAdmin/orderAdminDetail";
	}
	
	@RequestMapping("/orderAdminCancel.do")
	public String orderAdminCancel(@ModelAttribute OrderRecallCancelVO recallCancel) {
		logger.info("주문취소 호출");
		recallCancel.setRnc_gbn(OrderState.COMPLETE_CANCEL);
		orderAdminService.orderGroupUpdate(recallCancel);
		return "redirect:"+"/orderAdmin/orderAdminListRnc.do";
	}
	
	@RequestMapping("/orderAdminRecall.do")
	public String orderAdminRecall(@ModelAttribute OrderRecallCancelVO recallCancel) {
		logger.info("주문반품 호출");
		recallCancel.setRnc_gbn(OrderState.COMPLETE_RECALL);
		orderAdminService.orderGroupUpdate(recallCancel);
		OrderGroupVO ogv = orderAdminService.orderGroupDetail(String.valueOf(recallCancel.getOgr_no()));
		for (int i = 0; i < ogv.getOrderProductVO().size(); i++) {
			orderAdminService.updateProduct(ogv.getOrderProductVO().get(i));
		}
		return "redirect:"+"/orderAdmin/orderAdminListRnc.do";
	}
	
	public String checkLogin(HttpSession session) {
		session.getAttribute("hyunaMember");
		return "/admin/adminLogin.do";
	}

}
