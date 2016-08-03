package com.hyuna.vo.board;

import org.springframework.web.multipart.MultipartFile;

import com.hyuna.common.vo.CommonVO;

public class ReviewVO extends CommonVO{
	private int review_No = 0;
	private String Review_writedate = "";
	private String review_title = "";
	private String review_content = "";
	private int review_hit = 0;
	private int review_score = 0;	
	private MultipartFile file;
	private String review_file1 = "";
	private String review_modifydate = "";
	private int Mem_no = 0;
	private int Prd_d_no = 0;
	
	public int getReview_No() {
		return review_No;
	}
	public void setReview_No(int review_No) {
		this.review_No = review_No;
	}
	public String getReview_writedate() {
		return Review_writedate;
	}
	public void setReview_writedate(String review_writedate) {
		Review_writedate = review_writedate;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_hit() {
		return review_hit;
	}
	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getReview_modifydate() {
		return review_modifydate;
	}
	public void setReview_modifydate(String review_modifydate) {
		this.review_modifydate = review_modifydate;
	}
	public int getMem_no() {
		return Mem_no;
	}
	public void setMem_no(int mem_no) {
		Mem_no = mem_no;
	}
	public int getPrd_d_no() {
		return Prd_d_no;
	}
	public void setPrd_d_no(int prd_d_no) {
		Prd_d_no = prd_d_no;
	}
	public String getReview_file1() {
		return review_file1;
	}
	public void setReview_file1(String review_file1) {
		this.review_file1 = review_file1;
	}
	
	
}
