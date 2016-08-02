package com.hyuna.vo;

public class OrderProductVO {
	private int ord_no;
    private int ord_amount;
    private int ogr_no;
    private int prd_d_no;
	
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
}
