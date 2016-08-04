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
public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int orderGroupInsert(OrderGroupVO orderGroupVO) {
		return session.insert("orderGroupInsert", orderGroupVO);
	}

	@Override
	public int orderProductInsert(OrderProductVO oProductVO) {
		return session.insert("orderProductInsert", oProductVO);
	}

	@Override
	public OrderGroupVO orderGroupDetail(String ogr_no) {
		return session.selectOne("orderGroupDetail", ogr_no);
	}

	@Override
	public List<OrderGroupVO> selectOrderGroups(OrderVO orderVO) {
		return session.selectOne("selectOrderGroups", orderVO);
	}

	@Override
	public List<OrderProductVO> selectOrderProducts(int orderGroup_no) {
		return session.selectList("selectOrderProducts", orderGroup_no);
	}

	@Override
	public int orderCancelRecallInsert(OrderRecallCancelVO recallCancel) {
		return session.insert("orderCancelRecallInsert", recallCancel);
	}

	@Override
	public int orderGroupUpdate(OrderRecallCancelVO recallCancel) {
		return session.update("orderGroupUpdate", recallCancel);
	}

	@Override
	public OrderRecallCancelVO selectOrderRecallCancel(int group_no) {
		return session.selectOne("selectOrderRecallCancel", group_no);
	}

	@Override
	public int orderListCnt(OrderVO orderVO) {
		return session.selectOne("orderListCnt", orderVO);
	}

	@Override
	public List<OrderGroupVO> selectOrderGroupsNoPage(OrderVO orderVO) {
		return session.selectList("selectOrderGroupsNoPage", orderVO);
	}

}
