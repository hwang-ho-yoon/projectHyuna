package com.hyuna.service.order;

import java.util.List;

import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderProductVO;
import com.hyuna.vo.OrderRecallCancelVO;
import com.hyuna.vo.OrderVO;

public interface OrderAdminService {

	public int updateApproval(OrderGroupVO orderGroupVO);

	public List<OrderGroupVO> selectOrderGroups(OrderVO orderVO);

	public List<OrderProductVO> selectOrderProducts(int ogr_no);

	public int updateDelivery(OrderGroupVO orderGroupVO);

	public OrderRecallCancelVO selectOrderRecallCancel(int group_no);

	public OrderGroupVO orderGroupDetail(String ogr_no);

	public int orderGroupUpdate(OrderRecallCancelVO recallCancel);

	public int updateProduct(OrderProductVO orderProductVO);

}
