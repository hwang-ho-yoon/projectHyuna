package com.hyuna.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyuna.common.util.FileUploadUtil;
import com.hyuna.service.product.ProductService;
import com.hyuna.vo.ProductVO;



@Controller
@RequestMapping(value="/product")
public class ProductController {
	Logger logger =Logger.getLogger(ProductController.class);
	@Autowired//BoardService로 구현된 구현체를 자동으로 찾아d와 setter를 불러 설정한다.
	private ProductService productService;
	
	//관리자
	//첨부파일 게시판	//파일의 realpath를 위해 request객체를 같이 보냄.
	@RequestMapping(value="/productInsert.do",  method = RequestMethod.POST)
	public String productInsert(@ModelAttribute ProductVO pvo,HttpServletRequest request) throws IllegalStateException, IOException{
		
		logger.info("productInsert호출 성공");
		logger.info("fileName : " +pvo.getFile1().getOriginalFilename());//file확인
		logger.info("b_title : " +pvo.getImg_1());//file확인
		int result=0;
		String url="";
		String img_1="";//main
		String img_2="";//thumb
		String img_3="";//detail
		
		if(pvo.getFile1()!=null || pvo.getFile1().equals("")){
			img_1=FileUploadUtil.fileUpload(pvo.getFile1(),request,1);
		}else{
			img_1="";
		}
		pvo.setImg_1(img_1);
		
		if(pvo.getFile2()!=null || pvo.getFile2().equals("")){
			img_2=FileUploadUtil.fileUpload(pvo.getFile2(),request,2);
		}else{
			img_2="";
		}
		pvo.setImg_2(img_2);
		
		if(pvo.getFile3()!=null || pvo.getFile3().equals("")){
			img_3=FileUploadUtil.fileUpload(pvo.getFile3(),request,3);
		}else{
			img_3="";
		}
		pvo.setImg_3(img_3);
		
		System.out.println(pvo.toString());
		
		result=productService.productInsert(pvo);
		if(result==1){
			url="/product/prdRgtList.do";//board
		}
		return "redirect:"+url;//movepage의 기능을 한다.  공백이 들어가면 안된다.		
	}
	
	//관리자
	@RequestMapping(value="/prdRgtList.do",  method = RequestMethod.GET)
	public String prdRgtList(@ModelAttribute ProductVO pvo, Model model ){
		logger.info("prdRgtList 호출성공");

		
		
/*		//정렬에 대한 기본값 설정 :처음 조회시에는 매개변수가 없으므로 글번호로 내림차순 정렬한다.
		if(bvo.getOrder_by()==null)bvo.setOrder_by("b_num");
		if(bvo.getOrder_sc()==null)bvo.setOrder_sc("DESC");
		
		//정렬에 대한 데이터 확인
		logger.info("order_by=" + bvo.getOrder_by());
		logger.info("order_sc=" + bvo.getOrder_sc());
		
		//검색에 대한 데이터 확인
		logger.info("search =" + bvo.getSearch());
		logger.info("keyword=" + bvo.getKeyword());
		
		//페이지셋팅
		Paging.setPage(bvo);*/
		
		//전체레코드수 구현
		//int total=boardService.boardListCnt(bvo);
		//logger.info("total = " + total);
		//등록된 상품리스트를 조회한다.
		List<ProductVO> prdRgtList = productService.prdRgtList(pvo);
		logger.info("앞");
		model.addAttribute("prdRgtList", prdRgtList);
		logger.info("중간");
		//model.addAttribute("count", count);
		//model.addAttribute("total", total);
		model.addAttribute("data", pvo);
		logger.info("뒤");
		
		return "product/prdRgtList";
//		return "product/NewFile";
	}
	
	
	//관리자
	@RequestMapping(value="/prdWriteForm.do",  method = RequestMethod.GET)
	public String prdWriteForm(){
		logger.info("prdWriteForm호출성공");
		return "product/prdWriteForm";
	}
	//관리자
	@RequestMapping(value="/prdMgrDetail.do",  method = RequestMethod.GET)
	public String prdMgrDetail(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdMgrDetail호출성공");
		//master, img
		ProductVO prdMgrDetail=new ProductVO();
		prdMgrDetail=productService.prdMgrDetail(pvo);
		model.addAttribute("detail",prdMgrDetail);
		
		//option
		List<ProductVO> optList = productService.optList(pvo);
		model.addAttribute("optList", optList);
		
		
		return "product/prdMgrDetail";
	}
	//관리자
		@RequestMapping(value="/prdUpdateForm.do",  method = RequestMethod.POST)
		public String prdUpdateForm(@ModelAttribute ProductVO pvo, Model model){
			logger.info("prdUpdateForm호출성공");
			//master, img
			ProductVO prdMgrDetail=new ProductVO();
			prdMgrDetail=productService.prdMgrDetail(pvo);
			model.addAttribute("detail",prdMgrDetail);
			
			//option
			List<ProductVO> optList = productService.optList(pvo);
			model.addAttribute("optList", optList);
			
			
			return "product/prdUpdateForm";
		}
		@RequestMapping(value="/prdUpdate.do",  method = RequestMethod.POST)
		public String prdUpdate(@ModelAttribute ProductVO pvo, MultipartHttpServletRequest request, Model model) throws IllegalStateException, IOException{
			logger.info("prdUpdate호출성공");
			//master, img
			int result, imgResult=0;
			String page="";
			
			String img_1="";//main
			String img_2="";//thumb
			String img_3="";//detail
			
			
			
//			if(pvo.getFile1()!=null || !pvo.getFile1().equals("")||!pvo.getFile1().isEmpty()||){sout
			
			
			
			if(!pvo.getFile1().isEmpty()){
				img_1=FileUploadUtil.fileUpload(pvo.getFile1(),request,1);
			}else{
				img_1="";
			}
			pvo.setImg_1(img_1);
			
			if(!pvo.getFile2().isEmpty()){
				img_2=FileUploadUtil.fileUpload(pvo.getFile2(),request,2);
			}else{
				img_2="";
			}
			pvo.setImg_2(img_2);
			
			if(!pvo.getFile3().isEmpty()){
				img_3=FileUploadUtil.fileUpload(pvo.getFile3(),request,3);
			}else{
				img_3="";
			}
			pvo.setImg_3(img_3);
			System.out.println("File1.isEmpty : "+pvo.getFile1().isEmpty());
			System.out.println("File1.getName : "+pvo.getFile1().getName());
			System.out.println("File1.getSize : "+pvo.getFile1().getSize());
			System.out.println(pvo.toString());
			
			result=productService.prdUpdate(pvo);
			if(!img_1.equals("")||!img_2.equals("")||!img_3.equals("")){
			imgResult=productService.prdImageUpdate(pvo);
			}
			if(result==1){
				page="product/prdRgtList";
			}else{
				model.addAttribute("detail",pvo);
				page="product/prdUpdateForm";
			}
			return page;
		}
		
		@RequestMapping(value="/prdOptAdd.do",  method = RequestMethod.POST)
		public String prdOptAdd(@ModelAttribute ProductVO pvo,HttpServletRequest request) throws IllegalStateException, IOException{
			
			logger.info("prdOptAdd호출 성공");
			String url="";
			int result=productService.prdOptAdd(pvo);
			if(result==1){
				url="/product/prdUpdateForm.do";//board
			}
			return url;//movepage의 기능을 한다.  공백이 들어가면 안된다.		
		}
		
	
	//사용자 	pr
	@RequestMapping(value="/prdMainList.do",  method = RequestMethod.GET)
	public String prdMainList(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdMainList호출성공");
		List<ProductVO> prdMainList = productService.prdMainList(pvo);
		logger.info("Img_1 : "+prdMainList.get(0).getImg_1());
		
		model.addAttribute("prdMainList", prdMainList);
		model.addAttribute("data", pvo);
		return "product/prdMainList";
	}
	//사용자 
	@RequestMapping(value="/prdSingleDetail.do",  method = RequestMethod.GET)
	public String prdSingleDetail(@ModelAttribute ProductVO pvo, Model model){
		logger.info("prdSingleDetail호출성공");
		logger.info("Prd_no="+ pvo.getPrd_no());
		
		ProductVO detail=new ProductVO();
		detail=productService.prdSingleDetail(pvo);
		
		/*if(detail!=null && (!detail.equals(""))){
			detail.setB_content(detail.getB_content().toString().replace("\n", "<br>"));
		}*/
		model.addAttribute("detail",detail);
		return "product/prdSingleDetail";		
	}	
	
	
}
