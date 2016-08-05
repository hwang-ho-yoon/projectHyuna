package com.hyuna.service.product;

import java.util.List;

import com.hyuna.vo.ProductAllVO;
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
	public int prdImageInsert(ProductVO pvo);
	public int prdOptDelete(ProductVO pvo);
	public int prdOptUpdate(ProductVO pvo);
	public int detailPrdDelete(ProductVO pvo);
	public int masterPrdDelete(ProductVO pvo);
	
	
	//소비자 사용부분
	public List<ProductVO> prdMainList(ProductVO pvo);	
	public ProductVO prdSingleDetail(ProductVO pvo);
	
	public List<ProductVO> prdListLatest(ProductVO pvo);
	public List<ProductVO> prdListBest(ProductVO pvo);
	public List<ProductVO> prdSingleOption(ProductVO pvo);

	
	public List<ProductVO> colorOptList(ProductVO pvo);
	//product�쟾泥댁젙蹂� Service
		public List<ProductAllVO> prdAllList(ProductAllVO pvo);
		
		public List<ProductVO> colorList(ProductVO pvo);
		public List<ProductVO> modelList(ProductVO pvo);
		public List<ProductAllVO> prdAllList1(ProductAllVO pvo);
	

	
	
}

