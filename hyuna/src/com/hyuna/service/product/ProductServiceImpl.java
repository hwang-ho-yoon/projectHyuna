package com.hyuna.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.apache.log4j.Logger;

import com.hyuna.dao.product.ProductDao;
import com.hyuna.vo.ProductVO;

@Service	
@Transactional
public class ProductServiceImpl implements ProductService {
	Logger logger = Logger.getLogger(ProductServiceImpl.class);
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public int productInsert(ProductVO pvo) {
		// TODO Auto-generated method stub
		logger.info("productInsert-service 호출");
		int tf=0;
		int result=0;
		pvo.setPrd_no(productDao.get_prd_seq(pvo));
		
		//기본정보기입
		tf+=productDao.productInsert(pvo);
		
		//이미지정보기입
		tf+=productDao.productImageInsert(pvo);

		if(!pvo.getOptions().equals(null)||!pvo.getOptions().equals("")){
		//option정보기입
		tf+=optionSplit(pvo);
		}
		if(tf>1){
			result = 1;
		}
		
		return result;
	}


	private int optionSplit(ProductVO pvo) {
		logger.info("productInsert-service 호출");
		int opt_num=0;
		// TODO Auto-generated method stub
		ProductVO opt=new ProductVO();
		//option split start
		logger.info("options:"+pvo.getOptions());
		
		
		String[] optionRow=pvo.getOptions().split("/");
		logger.info(optionRow.length);
		
		
		
		//String[] optionElement=null;
		
		
		for(int rows=0; rows<optionRow.length; rows++ ){
			String[] optionElement=optionRow[rows].split(",");
			
			opt.setPrd_no(pvo.getPrd_no());
			opt.setModel_no(Integer.parseInt(optionElement[0]));
			opt.setColor_no(Integer.parseInt(optionElement[1]));
			opt.setPrd_d_stock(optionElement[2]);
			opt.setPrd_d_display(optionElement[3]);
			
			/*opt.setModel_no(Integer.parseInt(optionElement[rows].split(",")[0]));
			opt.setColor_no(Integer.parseInt(optionElement[rows].split(",")[1]));
			opt.setPrd_d_stock(optionElement[rows].split(",")[2]);
			opt.setPrd_d_display(optionElement[rows].split(",")[3]);*/
			
			//prdOpt.addAll(pvo.getPrd_no());
			//prdOpt.add(opt);
			logger.info("model : "+opt.getPrd_no());
			logger.info("model : "+opt.getModel_no());
			logger.info("color : "+opt.getColor_no());
			logger.info("stock : "+opt.getPrd_d_stock());
			logger.info("display : "+opt.getPrd_d_display());
			
			productDao.optionInsert(opt);
			opt_num++;
		}
		
		
		return opt_num;
	}


	@Override
	public List<ProductVO> prdRgtList(ProductVO pvo) {
		// TODO Auto-generated method stub
		List<ProductVO> prdRgtList=null;
		prdRgtList=productDao.prdRgtList(pvo);
		return prdRgtList;		
	}
	@Override
	public ProductVO prdMgrDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		ProductVO prdMgrDetail =productDao.prdMgrDetail(pvo);
		return prdMgrDetail;
	}
	@Override
	public List<ProductVO> optList(ProductVO pvo) {
		List<ProductVO> optList=null;
		optList=productDao.optList(pvo);
		return optList;
	}



	//소비자
	@Override
	public List<ProductVO> prdMainList(ProductVO pvo) {
		List<ProductVO> prdMainList=null;
		prdMainList=productDao.prdMainList(pvo);
		return prdMainList;
	}


	@Override
	public ProductVO prdSingleDetail(ProductVO pvo) {
			// TODO Auto-generated method stub
			ProductVO prdSingleDetail =productDao.prdSingleDetail(pvo);
			return prdSingleDetail;

	}


	@Override
	public int prdUpdate(ProductVO pvo) {
		int result =productDao.prdUpdate(pvo);
		return result;
	}


	@Override
	public int prdImageUpdate(ProductVO pvo) {
		int result =productDao.prdImageUpdate(pvo);
		// TODO Auto-generated method stub
		return result;
	}


	@Override
	public int prdOptAdd(ProductVO pvo) {
		int result =productDao.prdOptAdd(pvo);
		// TODO Auto-generated method stub
		return result;
	}

	
	
	



	
	

}
