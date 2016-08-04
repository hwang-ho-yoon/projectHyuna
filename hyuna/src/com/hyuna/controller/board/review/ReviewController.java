package com.hyuna.controller.board.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyuna.common.file.FileUploadUtil;
import com.hyuna.service.board.review.ReviewService;
import com.hyuna.service.product.ProductService;


import com.hyuna.vo.ProductAllVO;

import com.hyuna.vo.board.ReviewVO;


@Controller
@RequestMapping(value="/board/review")
public class ReviewController {
	Logger logger = Logger.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService; 

	
	//리스트 호출
	@RequestMapping("/reviewList")
	public String listDepartment(@ModelAttribute ReviewVO rvo, Model model) {
		logger.info("리스트");
		
		//정렬에 대한 기본값 설정		
		//if(bvo.getOrder_by()==null) qvo.setOrder_by("b_num");		
		//if(bvo.getOrder_sc()==null) qvo.setOrder_sc("DESC");

		
		//페이지 세팅
		com.hyuna.common.reviewpage.Paging.setPage(rvo);
		
		//전체 레코드수 구현
		int total = reviewService.reviewListCnt(rvo);
		
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		
		for (int i = 0; i < reviewList.size(); i++) {
			ReviewVO reviewVO = reviewList.get(i);
			ProductAllVO allVO = new ProductAllVO();
			allVO.setPrd_d_no(reviewVO.getPrd_d_no());
			
			List<ProductAllVO> allVOs = productService.prdAllList(allVO);
			
			if(allVOs.size() != 0){
				reviewVO.setPrd_name(allVOs.get(0).getPrd_name());
			}
		}
		
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("total", total);
		model.addAttribute("data", rvo);
		return "board/review/reviewList";
	}
	
	//글쓰기 폼이동
	@RequestMapping("/reviewWrite")
	public String reviewWrite(){
		logger.info("글씨기");
		return "board/review/reviewWrite";
	}
	
	//글쓰기 입력작업
	@RequestMapping("/reviewInsert")	
	public String reviewInsert(@ModelAttribute ReviewVO rvo, HttpServletRequest request)throws IllegalStateException,IOException{
		logger.info("글씨기 입력");
				
		int result = 0;
		String url = "";		

			String review_file1 = FileUploadUtil.fileUpload(rvo.getFile(), request);
			rvo.setReview_file1(review_file1);
				
		result = reviewService.reviewInsert(rvo);
		if(result==1){
			url = "/board/review/reviewList.do";
		}
		return "redirect:"+url;
	}
	
	//디테일 이동
	@RequestMapping("/reviewDetail")
	public String reviewDetail(@ModelAttribute ReviewVO rvo, Model model){
		logger.info("디테일 이동");
		
		ReviewVO detail = reviewService.reviewDetail(rvo);
		reviewService.reviewHit(rvo);

		model.addAttribute("detail", detail);		
		return "board/review/reviewDetail";
	}
	
	//수정
	@RequestMapping("/reviewUpdate")
	public String reviewUpdate(@ModelAttribute ReviewVO rvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("수정");
		
		String rvo_file1 = "";
		String url = "";
		if(!rvo.getFile().isEmpty()){			
			FileUploadUtil.fileDelete(rvo.getReview_file1(), request);
			rvo_file1 = FileUploadUtil.fileUpload(rvo.getFile(), request);
			rvo.setReview_file1(rvo_file1);		
		}else{			
			rvo.setReview_file1("");
		}
		int result = 0;		
		result = reviewService.reviewUpdate(rvo);
		if(result==1){
			url = "/board/review/reviewDetail.do?review_no="+rvo.getReview_no();
			
		}
		return "redirect:"+url;
	}
	
	//수정폼
	@RequestMapping("/reviewUpdateForm")
	public String reviewUpdateForm(@ModelAttribute ReviewVO rvo, Model model){
		logger.info("수정form");
		
		ReviewVO detail = reviewService.reviewDetail(rvo);
		reviewService.reviewHit(rvo);

		model.addAttribute("detail", detail);	
		return "board/review/reviewUpdate";
	}
	
	//삭제
	@RequestMapping("/reviewDelete")
	public String reviewDelete(@ModelAttribute ReviewVO rvo){
		logger.info("삭제");
		
		reviewService.reviewDelete(rvo);
		
		return "redirect:/board/review/reviewList.do";
	}
	
	
	
	
	
	
	//리스트 호출
		@RequestMapping("/prdreviewList")
		public String prdlistDepartment(@ModelAttribute ReviewVO rvo, Model model) {
			logger.info("리스트");
			
			//정렬에 대한 기본값 설정		
			//if(bvo.getOrder_by()==null) qvo.setOrder_by("b_num");		
			//if(bvo.getOrder_sc()==null) qvo.setOrder_sc("DESC");

			
			//페이지 세팅
			com.hyuna.common.reviewpage.Paging.setPage(rvo);
			
			//전체 레코드수 구현
			int total = reviewService.reviewListCnt(rvo);
			
			
			List<ReviewVO> reviewList = reviewService.reviewList(rvo);
			
			for (int i = 0; i < reviewList.size(); i++) {
				ReviewVO reviewVO = reviewList.get(i);
				ProductAllVO allVO = new ProductAllVO();
				allVO.setPrd_d_no(reviewVO.getPrd_d_no());
				
				List<ProductAllVO> allVOs = productService.prdAllList(allVO);
				
				if(allVOs.size() != 0){
					reviewVO.setPrd_name(allVOs.get(0).getPrd_name());
				}
			}
			
			
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("total", total);
			model.addAttribute("data", rvo);
			return "product/prdreviewList";
		}
		
		//글쓰기 폼이동
		@RequestMapping("/prdreviewWrite")
		public String prdreviewWrite(){
			logger.info("글씨기");
			return "product/prdreviewWrite";
		}
		
		//글쓰기 입력작업
		@RequestMapping("/prdreviewInsert")	
		public String prdreviewInsert(@ModelAttribute ReviewVO rvo, HttpServletRequest request)throws IllegalStateException,IOException{
			logger.info("글씨기 입력");
					
			int result = 0;
			String url = "";		

				String review_file1 = FileUploadUtil.fileUpload(rvo.getFile(), request);
				rvo.setReview_file1(review_file1);
					
			result = reviewService.reviewInsert(rvo);
			if(result==1){
				url = "product/prdreviewList.do";
			}
			return "redirect:"+url;
		}
		
		//디테일 이동
		@RequestMapping("/prdreviewDetail")
		public String prdreviewDetail(@ModelAttribute ReviewVO rvo, Model model){
			logger.info("디테일 이동");
			
			ReviewVO detail = reviewService.reviewDetail(rvo);
			reviewService.reviewHit(rvo);

			model.addAttribute("detail", detail);		
			return "product/prdreviewDetail";
		}
		
		//수정
		@RequestMapping("/prdreviewUpdate")
		public String prdreviewUpdate(@ModelAttribute ReviewVO rvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
			logger.info("수정");
			
			String rvo_file1 = "";
			String url = "";
			if(!rvo.getFile().isEmpty()){			
				FileUploadUtil.fileDelete(rvo.getReview_file1(), request);
				rvo_file1 = FileUploadUtil.fileUpload(rvo.getFile(), request);
				rvo.setReview_file1(rvo_file1);		
			}else{			
				rvo.setReview_file1("");
			}
			int result = 0;		
			result = reviewService.reviewUpdate(rvo);
			if(result==1){
				url = "/product/prdreviewDetail.do?review_no="+rvo.getReview_no();
				
			}
			return "redirect:"+url;
		}
		
		//수정폼
		@RequestMapping("/prdreviewUpdateForm")
		public String prdreviewUpdateForm(@ModelAttribute ReviewVO rvo, Model model){
			logger.info("수정form");
			
			ReviewVO detail = reviewService.reviewDetail(rvo);
			reviewService.reviewHit(rvo);

			model.addAttribute("detail", detail);	
			return "product/prdreviewUpdate";
		}
		
		//삭제
		@RequestMapping("/prdreviewDelete")
		public String prdreviewDelete(@ModelAttribute ReviewVO rvo){
			logger.info("삭제");
			
			reviewService.reviewDelete(rvo);
			
			return "redirect:/product/prdreviewList.do";
		}
}
