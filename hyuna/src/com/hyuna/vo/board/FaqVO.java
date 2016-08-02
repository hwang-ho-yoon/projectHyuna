package com.hyuna.vo.board;

import com.hyuna.controller.board.common.CommonVO;

public class FaqVO extends CommonVO{
	private int faq_no = 0;
	private String faq_writedate = ""; 
	private String faq_content = "";
	private String faq_title = "";
	private int faq_hit = 0;
	private String faq_modifydate = "";
	private String adm_id = "";
	
	
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_writedate() {
		return faq_writedate;
	}
	public void setFaq_writedate(String faq_writedate) {
		this.faq_writedate = faq_writedate;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public int getFaq_hit() {
		return faq_hit;
	}
	public int setFaq_hit(int faq_hit) {
		return this.faq_hit = faq_hit;
	}
	public String getFaq_modifydate() {
		return faq_modifydate;
	}
	public void setFaq_modifydate(String faq_modifydate) {
		this.faq_modifydate = faq_modifydate;
	}
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
	
	
	
}
