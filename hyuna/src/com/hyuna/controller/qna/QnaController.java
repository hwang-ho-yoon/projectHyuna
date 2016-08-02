package com.hyuna.controller.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyuna.common.util.FileUploadUtil;
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
	public String listDepartment(@ModelAttribute QnaVO qvo, Model model) {
		logger.info("리스트");
		
		//정렬에 대한 기본값 설정		
/*		if(bvo.getOrder_by()==null) qvo.setOrder_by("b_num");		
		if(bvo.getOrder_sc()==null) qvo.setOrder_sc("DESC");*/

		
/*		//페이지 세팅
		Paging.setPage(qvo);
		
		//전체 레코드수 구현
		int total = boardService.boardListCnt(bvo);
		logger.info("total ="+total);*/
		
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		//model.addAttribute("count", count);
		//model.addAttribute("total", total);
		model.addAttribute("data", qvo);
		return "board/qna/qnaList";
	}
	
	//글쓰기 폼이동
	@RequestMapping("/qnaWrite")
	public String qnaWrite(){
		logger.info("글씨기");
		return "board/qna/qnaWrite";
	}
	
	//글쓰기 입력작업
	@RequestMapping("/qnaInsert")
	public String qnaInsert(@ModelAttribute QnaVO qvo, HttpServletRequest request)throws IllegalStateException,IOException{
		logger.info("글씨기 입력");
				
		int result = 0;
		String url = "";
		System.out.println("file"+qvo.getFile());
		if(qvo.getFile()==null){			
			qvo.setQna_file1("");	
		}else{
			String qna_file1 = FileUploadUtil.fileUpload(qvo.getFile(), request);
			qvo.setQna_file1(qna_file1);
		}		
		result = qnaService.qnaInsert(qvo);
		if(result==1){
			url = "/board/qna/qnaList.do";
		}
		return "redirect:"+url;
	}
	
	//디테일 이동
	@RequestMapping("/qnaDetail")
	public String qnaDetail(@ModelAttribute QnaVO qvo, Model model){
		logger.info("디테일 이동");
		
		//QnaVO detail = qnaService.qnaDetail(qvo);
		qnaService.qnaHit(qvo);
		return null;
	}

}
