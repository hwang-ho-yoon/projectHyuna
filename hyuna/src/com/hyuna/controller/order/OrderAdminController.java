package com.hyuna.controller.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyuna.service.order.OrderService;
import com.hyuna.util.OrderState;
import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderVO;

@Controller
@RequestMapping(value="/orderAdmin")
public class OrderAdminController {
	
	Logger logger = Logger.getLogger(OrderAdminController.class);
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/orderAdminListApproval.do")
	public String orderAdminListApproval(Model model, HttpSession session) {
		OrderVO orderVO = new OrderVO();
		return "order/orderListRnc";
	}
	
	@RequestMapping("/orderAdminList.do")
	public String orderAdminList(Model model, HttpSession session) {
		OrderVO orderVO = new OrderVO();
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
}
