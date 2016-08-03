package com.hyuna.dao.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyuna.vo.ProductAllVO;
import com.hyuna.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSession session;
	
	/*******************
	 * 글 입력 구현, 매개변수 로 파라미터값을 전달한다.
	 * ***************/	
	@Override
	public int get_prd_seq(ProductVO pvo) {
		return session.selectOne("get_prd_seq");
	}	
	@Override
	public int productInsert(ProductVO pvo) {
		return session.insert("productInsert");
	}
	@Override
	public int productImageInsert(ProductVO pvo) {
		return session.insert("productImageInsert");
	}
	@Override
	public int optionInsert(ProductVO opt) {
		return session.insert("optionInsert");
	}
	@Override
	public List<ProductVO> prdRgtList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("prdRgtList");
	}
	@Override
	public ProductVO prdMgrDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectOne("prdMgrDetail");
	}
	@Override
	public List<ProductVO> optList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("optList");
	}
	@Override
	public int prdUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.update("prdUpdate");
	}
	@Override
	public int prdImageUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.update("prdImageUpdate");
	}
	
	
	
	
	
	
	@Override
	public List<ProductVO> prdMainList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("prdMainList");
	}

	@Override
	public ProductVO prdSingleDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectOne("prdSingleDetail");
	}
	@Override
	public int prdOptAdd(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("optionInsert");
	}
	
	@Override
	public List<ProductAllVO> prdAllList(ProductAllVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("prdAllList");
	}
	
}
