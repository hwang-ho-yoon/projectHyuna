package com.hyuna.controller.board.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board/faq")
public class Faqcontroller {

	@RequestMapping("/faqList.do")
	public String listDepartment() {
		System.out.println("TESST");
		return "board/faq/faqList";
	}
	@RequestMapping("/faqWrite.do")
	public String faqwrite(){
		System.out.println("writetest");
		return "board/faq/faqWrite";
	}
	@RequestMapping("/faqDetail.do")
	public String faqdetail(){
		System.out.println("detailtest");
		return "board/faq/faqDetail";
	}
}
