package com.hyuna.controller.board.review;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hyuna.service.board.review.ReviewService;
import com.hyuna.vo.board.ReviewVO;
	
	@Controller
	@RequestMapping(value="/board/review")
	public class Reviewcontroller {
		
		Logger logger = Logger.getLogger(Reviewcontroller.class);
		@Autowired
		private ReviewService reviewservice;
		
		@RequestMapping("/reviewList.do")
		public String listDepartment() {
			System.out.println("TESST");
			return "board/review/reviewList";
		}
		@RequestMapping("/reviewWrite.do")
		public String qnaWrite(){
			System.out.println("writetest");
			return "board/review/reviewWrite";
		}
		@RequestMapping("/reviewDetail.do")
		public String qnadetail(){
			System.out.println("detailtest");
			return "board/review/reviewDetail";
		}
		
		@RequestMapping(value="/reviewInsert", method=RequestMethod.POST)
		public String faqInsert(@ModelAttribute ReviewVO rvo, HttpSession session) throws IOException {
			logger.info("reviewInsert 호출성공");
			
			int result = 0;
			String url = "";
			System.out.println((String)session.getAttribute("hyunaMember"));
			rvo.setMem_no((int) session.getAttribute("hyunaMember"));
			result = reviewservice.reviewInsert(rvo);
			if (result == 1) {
				url = "/board/review/reviewList.do";
			}
			return "redirect:"+url;
		}
}
