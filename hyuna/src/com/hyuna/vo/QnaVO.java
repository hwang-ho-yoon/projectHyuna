package com.hyuna.vo;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
	private int qna_no;
	private String qna_writeday;
	private String qna_title;
	private String qna_content;
	private int qna_hit;
	private String qna_category;
	private String qna_file1;
	private String qna_modifydate;
	private int mem_no;
	private int prd_d_no;
	private MultipartFile file;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_writeday() {
		return qna_writeday;
	}
	public void setQna_writeday(String qna_writeday) {
		this.qna_writeday = qna_writeday;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getQna_hit() {
		return qna_hit;
	}
	public void setQna_hit(int qna_hit) {
		this.qna_hit = qna_hit;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public String getQna_file1() {
		return qna_file1;
	}
	public void setQna_file1(String qna_file1) {
		this.qna_file1 = qna_file1;
	}
	public String getQna_modifydate() {
		return qna_modifydate;
	}
	public void setQna_modifydate(String qna_modifydate) {
		this.qna_modifydate = qna_modifydate;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getPrd_d_no() {
		return prd_d_no;
	}
	public void setPrd_d_no(int prd_d_no) {
		this.prd_d_no = prd_d_no;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
