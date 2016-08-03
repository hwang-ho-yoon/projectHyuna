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

import com.hyuna.common.util.FileUploadUtil;
import com.hyuna.service.board.review.ReviewService;

import com.hyuna.vo.board.ReviewVO;

@Controller
@RequestMapping(value="/board/review")
public class ReviewController {
	Logger logger = Logger.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	//리스트 호출
	@RequestMapping("/reviewList")
	public String listDepartment(@ModelAttribute ReviewVO rvo, Model model) {
		logger.info("리스트");
		
		//정렬에 대한 기본값 설정		
/*		if(bvo.getOrder_by()==null) qvo.setOrder_by("b_num");		
		if(bvo.getOrder_sc()==null) qvo.setOrder_sc("DESC");*/

		
/*		//페이지 세팅
		Paging.setPage(qvo);
		
		//전체 레코드수 구현
		int total = boardService.boardListCnt(bvo);
		logger.info("total ="+total);*/
		
		List<ReviewVO> reviewList = reviewService.reviewList(rvo);
		model.addAttribute("qnaList", reviewList);
		//model.addAttribute("count", count);
		//model.addAttribute("total", total);
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
	public String qnaInsert(@ModelAttribute ReviewVO rvo, HttpServletRequest request)throws IllegalStateException,IOException{
		logger.info("글씨기 입력");
				
		int result = 0;
		String url = "";
		System.out.println("file"+rvo.getFile());
		if(rvo.getFile()==null){			
			rvo.setReview_file1("");	
		}else{
			String review_file1 = FileUploadUtil.fileUpload(rvo.getFile(), request);
			rvo.setReview_file1(review_file1);
		}		
		result = reviewService.reviewInsert(rvo);
		if(result==1){
			url = "/board/review/reviewList.do";
		}
		return "redirect:"+url;
	}
	
	//디테일 이동
	@RequestMapping("/reviewDetail")
	public String qnaDetail(@ModelAttribute ReviewVO rvo, Model model){
		logger.info("디테일 이동");
		
		//ReviewVO detail = reviewService.reviewDetail(rvo);
		reviewService.reviewHit(rvo);
		return null;
	}

}
