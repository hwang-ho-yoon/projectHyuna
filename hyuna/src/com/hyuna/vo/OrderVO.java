package com.hyuna.vo;

import com.hyuna.common.vo.CommonVO;

public class OrderVO extends CommonVO{
	private int mem_no;
	private String ogr_state1;
	private String ogr_state2;
	private String ogr_state3;
	private String ogr_state4;
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getOgr_state1() {
		return ogr_state1;
	}
	public void setOgr_state1(String ogr_state1) {
		this.ogr_state1 = ogr_state1;
	}
	public String getOgr_state2() {
		return ogr_state2;
	}
	public void setOgr_state2(String ogr_state2) {
		this.ogr_state2 = ogr_state2;
	}
	public String getOgr_state3() {
		return ogr_state3;
	}
	public void setOgr_state3(String ogr_state3) {
		this.ogr_state3 = ogr_state3;
	}
	public String getOgr_state4() {
		return ogr_state4;
	}
	public void setOgr_state4(String ogr_state4) {
		this.ogr_state4 = ogr_state4;
	}
	
}
