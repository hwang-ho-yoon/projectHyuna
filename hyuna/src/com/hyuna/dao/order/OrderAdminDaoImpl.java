package com.hyuna.dao.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyuna.vo.OrderGroupVO;
import com.hyuna.vo.OrderProductVO;
import com.hyuna.vo.OrderRecallCancelVO;
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

	@Override
	public OrderRecallCancelVO selectOrderRecallCancel(int group_no) {
		return session.selectOne("selectOrderRecallCancel", group_no);
	}

	@Override
	public OrderGroupVO orderGroupDetail(String ogr_no) {
		return session.selectOne("orderGroupDetail", ogr_no);
	}

	@Override
	public int orderGroupUpdate(OrderRecallCancelVO recallCancel) {
		return session.update("orderGroupUpdate", recallCancel);
	}
}
