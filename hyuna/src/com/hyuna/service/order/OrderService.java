package com.hyuna.service.order;

import java.util.List;

import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderProductVO;
import com.hyuna.vo.OrderRecallCancelVO;
import com.hyuna.vo.OrderVO;

public interface OrderService {
	public int orderGroupInsert(OrderGroupVO orderGroupVO);
	public int orderProductInsert(OrderGroupVO ogv);
	public OrderGroupVO orderGroupDetail(String ogr_no);
	public List<OrderGroupVO> selectOrderGroups(OrderVO orderVO);
	public List<OrderProductVO> selectOrderProducts(int orderGroup_no);
	public int orderCancelRecallInsert(OrderRecallCancelVO recallCancel);
	public int orderGroupUpdate(OrderRecallCancelVO recallCancel);
	public OrderRecallCancelVO selectOrderRecallCancel(int group_no);
}
