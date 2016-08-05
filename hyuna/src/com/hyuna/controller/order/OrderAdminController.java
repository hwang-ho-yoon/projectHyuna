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

import com.hyuna.service.member.MemberService;
import com.hyuna.service.order.OrderAdminService;
import com.hyuna.service.product.ProductService;
import com.hyuna.util.OrderState;
import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderProductVO;
import com.hyuna.vo.OrderRecallCancelVO;
import com.hyuna.vo.OrderVO;
import com.hyuna.vo.ProductAllVO;

@Controller
@RequestMapping(value="/orderAdmin")
public class OrderAdminController {
	
	Logger logger = Logger.getLogger(OrderAdminController.class);
	@Autowired
	private OrderAdminService orderAdminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductService productService; 
	
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
			orderGroupsVO.setMem_id((memberService.throwMember(orderGroupsVO.getMem_no())).getMem_id());
			List<OrderProductVO> orderProductVOs = orderAdminService.selectOrderProducts(orderGroupsVO.getOgr_no());
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
			orderGroupsVO.setMem_id((memberService.throwMember(orderGroupsVO.getMem_no())).getMem_id());
			List<OrderProductVO> orderProductVOs = orderAdminService.selectOrderProducts(orderGroupsVO.getOgr_no());
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
		List<OrderProductVO> orderProductVOs = orderAdminService.selectOrderProducts(ogv.getOgr_no());
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
		model.addAttribute("productAllVO", productAllVOs);;
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
