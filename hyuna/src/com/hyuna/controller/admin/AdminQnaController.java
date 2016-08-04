package com.hyuna.controller.admin;

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

import com.hyuna.service.product.ProductService;
import com.hyuna.service.qna.QnaService;
import com.hyuna.vo.ProductAllVO;
import com.hyuna.vo.QnaVO;

@Controller
@RequestMapping(value="/adminQna")
public class AdminQnaController {
	Logger logger = Logger.getLogger(AdminQnaController.class);
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ProductService productService; 

	
	//리스트 호출
	@RequestMapping("/qnaList.do")
	public String listDepartment(@ModelAttribute QnaVO qvo, Model model) {
		logger.info("리스트");
		
		//정렬에 대한 기본값 설정		
		if(qvo.getOrder_by()==null) qvo.setOrder_by("qno_no");		
		if(qvo.getOrder_sc()==null) qvo.setOrder_sc("DESC");

		
		//페이지 세팅
		com.hyuna.common.qnapage.Paging.setPage(qvo);
		
		//전체 레코드수 구현
		int total = qnaService.qnaListCnt(qvo);
		
		
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		
		for (int i = 0; i < qnaList.size(); i++) {
			QnaVO qnaVO = qnaList.get(i);
			ProductAllVO allVO = new ProductAllVO();
			allVO.setPrd_d_no(qnaVO.getPrd_no());
			List<ProductAllVO> allVOs = productService.prdAllList(allVO);
			if(qnaVO.getPrd_no()==0){
				qnaVO.setPrd_name("");
			}else{
				qnaVO.setPrd_name(allVOs.get(0).getPrd_name());
			}
			
		}
		
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("total", total);
		model.addAttribute("data", qvo);
		return "adminQna/qnaList";
	}
	
	//글쓰기 폼이동
	@RequestMapping("/qnaWrite")
	public String qnaWrite(){
		logger.info("글씨기");
		return "adminQna/qnaWrite";
	}
	
	//글쓰기 입력작업
	@RequestMapping("/qnaInsert")	
	public String qnaInsert(@ModelAttribute QnaVO qvo, HttpServletRequest request)throws IllegalStateException,IOException{
		logger.info("글씨기 입력");
				
		int result = 0;
		String url = "";		

			String qna_file1 = FileUploadUtil.fileUpload(qvo.getFile(), request);
			qvo.setQna_file1(qna_file1);
				
		result = qnaService.qnaInsert(qvo);
		if(result==1){
			url = "/adminQna/qnaList.do";
		}
		return "redirect:"+url;
	}
	
	//디테일 이동
	@RequestMapping("/qnaDetail")
	public String qnaDetail(@ModelAttribute QnaVO qvo, Model model){
		logger.info("디테일 이동");
		
		qnaService.qnaHit(qvo);
		QnaVO detail = qnaService.qnaDetail(qvo);		

		model.addAttribute("detail", detail);		
		return "adminQna/qnaDetail";
	}
	
	//수정
	@RequestMapping("/qnaUpdate")
	public String qnaUpdate(@ModelAttribute QnaVO qvo, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("수정");
		
		String qvo_file1 = "";
		String url = "";
		if(!qvo.getFile().isEmpty()){			
			FileUploadUtil.fileDelete(qvo.getQna_file1(), request);
			qvo_file1 = FileUploadUtil.fileUpload(qvo.getFile(), request);
			qvo.setQna_file1(qvo_file1);		
		}else{			
			qvo.setQna_file1("");
		}
		int result = 0;		
		result = qnaService.qnaUpdate(qvo);
		if(result==1){
			url = "/adminQna/qnaDetail.do?qna_no="+qvo.getQna_no()+"&page="+qvo.getPage()+"&pageSize="+qvo.getPageSize();
			
		}
		return "redirect:"+url;
	}
	
	//수정폼
	@RequestMapping("/qnaUpdateForm")
	public String qnaUpdateForm(@ModelAttribute QnaVO qvo, Model model){
		logger.info("수정form");
		
		QnaVO detail = qnaService.qnaDetail(qvo);
		qnaService.qnaHit(qvo);

		model.addAttribute("detail", detail);	
		return "adminQna/qnaUpdate";
	}
	
	//삭제
	@RequestMapping("/qnaDelete")
	public String qnaDelete(@ModelAttribute QnaVO qvo){
		logger.info("삭제");
		
		qnaService.qnaDelete(qvo);
		
		return "redirect:/adminQna/qnaList.do";
	}

}
