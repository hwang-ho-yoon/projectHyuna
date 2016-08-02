package com.hyuna.controller.qna;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyuna.service.qna.QnaService;
import com.hyuna.vo.QnaVO;

@Controller
@RequestMapping(value="/board/qna")
public class QnaController {
	Logger logger = Logger.getLogger(QnaController.class);
	
	@Autowired
	private QnaService qnaService;
	
	//리스트 호출
	@RequestMapping("/qnaList")
	public String listDepartment() {
		logger.info("리스트");
		return "board/qna/qnaList";
	}
	
	//글쓰기 폼이동
	@RequestMapping("/qnaWrite")
	public String qnaWrite(){
		logger.info("글씨기");
		return "board/qna/qnaWrite";
	}
	
	//글쓰기 입력작업
	public String qnaInsert(@ModelAttribute QnaVO qvo){
		logger.info("글씨기 입력");
		
		int result = 0;
		String url = "";
		result = qnaService.qnaInsert(qvo);
		if(result==1){
			url = "/board/qna/qnaList.jsp";
		}
		return "redirect:"+url;
	}
}
