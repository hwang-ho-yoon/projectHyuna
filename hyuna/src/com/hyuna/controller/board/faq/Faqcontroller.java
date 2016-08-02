package com.hyuna.controller.board.faq;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hyuna.service.board.faq.FaqService;
import com.hyuna.vo.board.FaqVO;
import com.hyuna.controller.board.page.Paging;

import org.apache.log4j.Logger;

@Controller
@RequestMapping(value="/board/faq")
public class Faqcontroller {
	Logger logger = Logger.getLogger(Faqcontroller.class);
	@Autowired
	private FaqService faqservice;
	
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
	@RequestMapping("/faqUpdateForm.do")
	public String faqUpdate(@ModelAttribute FaqVO fvo, Model model){
		FaqVO detail =  faqservice.FaqDetail(fvo);
		
		if (detail != null && (!detail.equals(""))) {
			detail.setFaq_content(detail.getFaq_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		return "board/faq/faqUpdate";
	}
	
	@RequestMapping(value="/faqInsert", method=RequestMethod.POST)
	public String faqInsert(@ModelAttribute FaqVO fvo, HttpSession session) throws IOException {
		logger.info("boardInsert ȣ�� ����");
		
		int result = 0;
		String url = "";
		System.out.println((String)session.getAttribute("adminId"));
		fvo.setAdm_id((String)session.getAttribute("adminId"));
		result = faqservice.faqInsert(fvo);
		if (result == 1) {
			url = "/board/faq/faqList.do";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/faqList.do", method = RequestMethod.GET)
	public String faqList(@ModelAttribute FaqVO fvo, Model model) {
		logger.info("faqList ȣ�� ����");
		
		/*���Ŀ� ���� �⺻�� ����*/
		if(fvo.getOrder_by() == null) {
			fvo.setOrder_by("faq_no");
		}
		if(fvo.getOrder_sc() == null) {
			fvo.setOrder_sc("DESC");
		}
		
		// ���Ŀ� ���� ������ Ȯ��
		logger.info("order_by = " +fvo.getOrder_by());
		logger.info("order_sc = " +fvo.getOrder_sc());
		
		// ������ ����
		Paging.setPage(fvo);
		
		//��ü ���ڵ� �� ����
		int total = faqservice.faqListCnt(fvo);
		logger.info("totla = " + total);
		
		List<FaqVO> faqList = faqservice.faqList(fvo);
		model.addAttribute("faqList", faqList);
//		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", fvo);
		return "board/faq/faqList";
	}
	
	@RequestMapping(value="/faqDetail.do", method = RequestMethod.GET)
	public String boardDetail(@ModelAttribute FaqVO fvo, Model model) {
		logger.info("boardDetail ȣ�� ����");
		logger.info("faq_no = " + fvo.getFaq_no());
		
		FaqVO detail =  faqservice.FaqDetail(fvo);
		System.out.println(faqservice.faqHit(fvo));
		faqservice.faqHit(fvo);
		
		if (detail != null && (!detail.equals(""))) {
			detail.setFaq_content(detail.getFaq_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		
		return "board/faq/faqDetail";
	}
	
	@RequestMapping(value="/faqUpdate.do", method=RequestMethod.POST)
	public String faqUpdate(@ModelAttribute FaqVO fvo, HttpSession session){
		logger.info("boardUpdate 실행됨");
		int result = 0;
		String url = "";
		fvo.setAdm_id((String)session.getAttribute("adminId"));
		result = faqservice.faqUpdate(fvo);
		if (result == 1) {
			url = "/board/faq/faqList.do?faq_no="+fvo.getFaq_no()+"&page="+fvo.getPage();
		}
		return "redirect:"+url;
 	}
	
	@RequestMapping(value="/faqDelete.do", method=RequestMethod.GET)
	public String boardDelete(@ModelAttribute FaqVO fvo) {
		logger.info("boardDelete 실행됨");
		int result = 0;
		String url = "";
		result = faqservice.faqDelete(fvo);
		if (result == 1) {
			url = "/board/faq/faqList.do";
		}
		return "redirect:"+url;
	}
}
