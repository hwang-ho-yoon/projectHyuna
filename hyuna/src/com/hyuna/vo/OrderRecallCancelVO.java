package com.hyuna.vo;

import com.hyuna.common.vo.CommonVO;

public class OrderRecallCancelVO extends CommonVO{
	private int rnc_no;
	private String rnc_date;
	private String rnc_desc;
	private String rnc_gbn;
	private int ogr_no;
	
	public int getRnc_no() {
		return rnc_no;
	}
	public void setRnc_no(int rnc_no) {
		this.rnc_no = rnc_no;
	}
	public String getRnc_date() {
		return rnc_date;
	}
	public void setRnc_date(String rnc_date) {
		this.rnc_date = rnc_date;
	}
	public String getRnc_desc() {
		return rnc_desc;
	}
	public void setRnc_desc(String rnc_desc) {
		this.rnc_desc = rnc_desc;
	}
	public String getRnc_gbn() {
		return rnc_gbn;
	}
	public void setRnc_gbn(String rnc_gbn) {
		this.rnc_gbn = rnc_gbn;
	}
	public int getOgr_no() {
		return ogr_no;
	}
	public void setOgr_no(int ogr_no) {
		this.ogr_no = ogr_no;
	}
}
