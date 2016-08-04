package com.hyuna.vo;

public class OrderProductVO {
	private int ord_no;
    private int ord_amount;
    private int ogr_no;
    private int prd_d_no;
    private String prd_name;
    private String color_detail;
    private String model_machine;
    private int prd_saleprice;
	
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getOrd_amount() {
		return ord_amount;
	}
	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}
	public int getOgr_no() {
		return ogr_no;
	}
	public void setOgr_no(int ogr_no) {
		this.ogr_no = ogr_no;
	}
	public int getPrd_d_no() {
		return prd_d_no;
	}
	public void setPrd_d_no(int prd_d_no) {
		this.prd_d_no = prd_d_no;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public String getColor_detail() {
		return color_detail;
	}
	public void setColor_detail(String color_detail) {
		this.color_detail = color_detail;
	}
	public String getModel_machine() {
		return model_machine;
	}
	public void setModel_machine(String model_machine) {
		this.model_machine = model_machine;
	}
	public int getPrd_saleprice() {
		return prd_saleprice;
	}
	public void setPrd_saleprice(int prd_saleprice) {
		this.prd_saleprice = prd_saleprice;
	}
}
