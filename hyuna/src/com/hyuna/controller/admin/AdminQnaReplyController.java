package com.hyuna.controller.admin;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hyuna.controller.qna.QnaReplyController;
import com.hyuna.service.qna.QnaReplyService;
import com.hyuna.vo.QnaReplyVO;

@RestController
@RequestMapping(value="/adminQna/qnaReply")
public class AdminQnaReplyController {
Logger logger = Logger.getLogger(QnaReplyController.class);
	
	@Autowired
	private QnaReplyService qnaReplyService;
		
	//리플 리스트
	@RequestMapping(value="/all/{qna_no}.do", method = RequestMethod.GET)
	public ResponseEntity<List<QnaReplyVO>> list(@PathVariable("qna_no") Integer qna_no, Model model){
		 ResponseEntity<List<QnaReplyVO>> entity = null;
		 try{
			 entity = new ResponseEntity<>(qnaReplyService.replyList(qna_no),HttpStatus.OK);
		 }catch(Exception e){
			 e.printStackTrace();
			 entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		 }		 
		 return entity;
	}
	
	//리플 입력
	@RequestMapping(value="/replyInsert")
	public ResponseEntity<String> replyInsert(@RequestBody QnaReplyVO rvo){
		logger.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;
		try{
			result = qnaReplyService.replyInsert(rvo);
			if(result==1){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);			
		}
		return entity;
	}
	
	//리플수정
	
	@RequestMapping(value="/{qna_reply_no}.do", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("qna_reply_no") Integer qna_reply_no, @RequestBody QnaReplyVO rvo){
		logger.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		try{
			rvo.setQna_reply_no(qna_reply_no);
			qnaReplyService.replyUpdate(rvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//삭제
	@RequestMapping(value="/{qna_reply_no}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyUpdate(@PathVariable("qna_reply_no") Integer qna_reply_no){
		logger.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		try{			
			qnaReplyService.replyDelete(qna_reply_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
