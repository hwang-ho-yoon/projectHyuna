package com.hyuna.controller.board.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board/review")
public class Reviewcontroller {

	@RequestMapping("/reviewList.do")
	public String listDepartment() {
		System.out.println("TESST");
		return "board/review/reviewList";
	}
	@RequestMapping("/reviewWrite.do")
	public String reviewWrite(){
		System.out.println("writetest");
		return "board/review/reviewWrite";
	}
	@RequestMapping("/reviewDetail.do")
	public String reviewdetail(){
		System.out.println("detailtest");
		return "board/review/reviewDetail";
	}
}
