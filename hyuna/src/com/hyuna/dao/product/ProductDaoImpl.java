package com.hyuna.dao.product;

import java.util.ArrayList;
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
	public int prdOptAdd(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("prdOptAdd");
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
	public List<ProductVO> prdListLatest(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("prdListLatest");
	}
	@Override
	public List<ProductVO> prdListBest(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("prdListBest");
	}
	
	@Override
	public int prdOptDelete(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.update("prdOptDelete");
	}
	@Override
	public int prdOptUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.delete("prdOptUpdate");
	}
	@Override
	public int masterPrdDelete(ProductVO pvo) {
		// TODO Auto-generated method stub
		int result = session.delete("masterPrdDelete");
		session.commit();
		return result;
	}
	@Override
	public int detailPrdDelete(ProductVO pvo) {
		// TODO Auto-generated method stub
		int result = session.delete("detailPrdDelete");
		session.commit();
		return result;
	}
	@Override
	public List<ProductVO> prdSingleOption(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("prdSingleOption");
	}

	@Override
	public List<ProductVO> colorOptList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("colorOptList");
	}
	
	@Override
	public List<ProductAllVO> prdAllList(ProductAllVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("prdAllList");
	}
	@Override
	public List<ProductVO> colorList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("colorList");
	}
	@Override
	public List<ProductVO> modelList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("modelList");
	}
	@Override
	public List<ProductAllVO> prdAllList1(ProductAllVO pvo) {
		
		return session.selectList("prdAllList1");
	}
	@Override
	public List<ProductAllVO> prdOptColorList(ProductAllVO pvo) {
		
		return session.selectList("prdOptColorList");
	}
	@Override
	public List<ProductAllVO> prdOptMachineList(ProductAllVO pvo) {
		
		return session.selectList("prdOptMachineList");
	}
	@Override
	public int deleteOpt(int []option_nos) {
		System.out.println(option_nos.toString());
		int result = session.update("deleteOpt",option_nos);
		return result;
	}
	@Override
	public int insertBrdOpt(ProductVO pvo) {		
		int result = session.insert("insertBrdOpt");
		return result;
	}
	
	@Override
	public int insertClrOpt(ProductVO pvo) {		
		int result = session.insert("insertClrOpt");
		return result;
	}

}
