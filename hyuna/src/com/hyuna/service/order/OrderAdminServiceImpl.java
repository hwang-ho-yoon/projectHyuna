package com.hyuna.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyuna.dao.order.OrderAdminDao;
import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderProductVO;
import com.hyuna.vo.OrderVO;

@Service
@Transactional
public class OrderAdminServiceImpl implements OrderAdminService{

	@Autowired
	private OrderAdminDao orderAdminDao; 
	
	@Override
	public int updateApproval(OrderGroupVO orderGroupVO) {
		return orderAdminDao.updateApproval(orderGroupVO);
	}

	@Override
	public List<OrderGroupVO> selectOrderGroups(OrderVO orderVO) {
		return orderAdminDao.selectOrderGroups(orderVO);
	}

	@Override
	public List<OrderProductVO> selectOrderProducts(int ogr_no) {
		return orderAdminDao.selectOrderProducts(ogr_no);
	}

	@Override
	public int updateDelivery(OrderGroupVO orderGroupVO) {
		return orderAdminDao.updateDelivery(orderGroupVO);
	}

}
