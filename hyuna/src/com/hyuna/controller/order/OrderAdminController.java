package com.hyuna.controller.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyuna.service.order.OrderAdminService;
import com.hyuna.service.order.OrderService;
import com.hyuna.util.OrderState;
import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderVO;

@Controller
@RequestMapping(value="/orderAdmin")
public class OrderAdminController {
	
	Logger logger = Logger.getLogger(OrderAdminController.class);
	@Autowired
	private OrderAdminService orderAdminService;
	
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
		}
		model.addAttribute("orderGroups", orderGroupsVOs);
		return "orderAdmin/orderAdminList";
	}

	public String checkLogin(HttpSession session) {
		session.getAttribute("hyunaMember");
		return "/admin/adminLogin.do";
	}

}
