package com.hyuna.vo;

import org.springframework.web.multipart.MultipartFile;

import com.hyuna.common.vo.CommonVO;

public class QnaVO extends CommonVO{
	private int qna_no;
	private String qna_writedate;
	private String qna_title;
	private String qna_content;
	private int qna_hit;
	private String qna_category;
	private String qna_file1;
	private String qna_modifydate;
	private int mem_no;
	private int prd_no;
	private MultipartFile file;
	private String prd_name;
	private String mem_name;

	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
		
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_writedate() {
		return qna_writedate;
	}
	public void setQna_writedate(String qna_writedate) {
		this.qna_writedate = qna_writedate;
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
	public int getPrd_no() {
		return prd_no;
	}
	public void setPrd_no(int prd_no) {
		this.prd_no = prd_no;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
