package com.hyuna.dao.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderProductVO;
import com.hyuna.vo.OrderVO;

@Repository
public class OrderAdminDaoImpl implements OrderAdminDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int updateApproval(OrderGroupVO orderGroupVO) {
		return session.update("updateApproval", orderGroupVO);
	}

	@Override
	public List<OrderGroupVO> selectOrderGroups(OrderVO orderVO) {
		return session.selectList("selectOrderGroups", orderVO);
	}

	@Override
	public List<OrderProductVO> selectOrderProducts(int ogr_no) {
		return session.selectList("selectOrderProducts", ogr_no);
	}

	@Override
	public int updateDelivery(OrderGroupVO orderGroupVO) {
		return session.update("updateDelivery", orderGroupVO);
	}
}
