package com.hyuna.service.product;

import java.util.List;

import com.hyuna.vo.ProductVO;

public interface ProductService {
	//관리자 사용부분
	public int productInsert(ProductVO pvo);
	public List<ProductVO> prdRgtList(ProductVO pvo);
	public ProductVO prdMgrDetail(ProductVO pvo);
	public List<ProductVO> optList(ProductVO pvo);
	public int prdUpdate(ProductVO pvo);
	public int prdImageUpdate(ProductVO pvo);
	public int prdOptAdd(ProductVO pvo);
	
	
	//소비자 사용부분
	public List<ProductVO> prdMainList(ProductVO pvo);	
	public ProductVO prdSingleDetail(ProductVO pvo);
	
}
