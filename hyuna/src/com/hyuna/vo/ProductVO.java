package com.hyuna.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO{
	private int prd_no;
	private String prd_name;
	private String prd_manufacturer;
	private String prd_origine;
	
	private String prd_display;
	
	private int prd_prcprice;
	private int prd_orgprice;
	private int prd_saleprice;
	
	private String prd_desc;
	
	private String prd_inputdate;
	private String option_color;
	private String option_brand;
	
	private int img_no;
	
	
	private MultipartFile file1;
	private String img_1;

	private MultipartFile file2;
	private String img_2;
	
	private MultipartFile file3;
	private String img_3;
	
	private String options;

	private String model;
	private int model_no;
	private String color;
	private int color_no;
	
	private String prd_d_stock;
	private String prd_d_display;
	
	private int prd_d_no;
	
	//관리자 제품조회시 옵션관련
	private String color_detail;
	private String model_brand;
	private String model_machine;
	
	
	
	public int getPrd_no() {
		return prd_no;
	}
	public void setPrd_no(int prd_no) {
		this.prd_no = prd_no;
	}
	public String getPrd_name() {
		return prd_name;
	}
	
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	public String getPrd_manufacturer() {
		return prd_manufacturer;
	}
	public void setPrd_manufacturer(String prd_manufacturer) {
		this.prd_manufacturer = prd_manufacturer;
	}
	public String getPrd_origine() {
		return prd_origine;
	}
	public void setPrd_origine(String prd_origine) {
		this.prd_origine = prd_origine;
	}
	public int getPrd_prcprice() {
		return prd_prcprice;
	}
	public void setPrd_prcprice(int prd_prcprice) {
		this.prd_prcprice = prd_prcprice;
	}
	public int getPrd_orgprice() {
		return prd_orgprice;
	}
	public void setPrd_orgprice(int prd_orgprice) {
		this.prd_orgprice = prd_orgprice;
	}
	public int getPrd_saleprice() {
		return prd_saleprice;
	}
	public void setPrd_saleprice(int prd_saleprice) {
		this.prd_saleprice = prd_saleprice;
	}
	
	public String getOption_color() {
		return option_color;
	}
	public void setOption_color(String option_color) {
		this.option_color = option_color;
	}
	public String getOption_brand() {
		return option_brand;
	}
	public void setOption_brand(String option_brand) {
		this.option_brand = option_brand;
	}
	
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	
	public MultipartFile getFile3() {
		return file3;
	}
	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	

	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getColor_no() {
		return color_no;
	}
	public void setColor_no(int color_no) {
		this.color_no = color_no;
	}

	public String getPrd_display() {
		return prd_display;
	}
	public void setPrd_display(String prd_display) {
//		if(prd_display.equalsIgnoreCase("on"))
//			prd_display="Y";
//		else prd_display="N";
		this.prd_display = prd_display;
	}
	public String getPrd_desc() {
		return prd_desc;
	}
	public void setPrd_desc(String prd_desc) {
		this.prd_desc = prd_desc;
	}
	
	public String getPrd_d_stock() {
		return prd_d_stock;
	}
	public void setPrd_d_stock(String prd_d_stock) {
		this.prd_d_stock = prd_d_stock;
	}
	public String getPrd_d_display() {
		return prd_d_display;
	}
	public void setPrd_d_display(String prd_d_display) {
		this.prd_d_display = prd_d_display;
	}
	public int getPrd_d_no() {
		return prd_d_no;
	}
	public void setPrd_d_no(int prd_d_no) {
		this.prd_d_no = prd_d_no;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getModel_no() {
		return model_no;
	}
	public void setModel_no(int model_no) {
		this.model_no = model_no;
	}
	public String getPrd_inputdate() {
		return prd_inputdate;
	}
	public void setPrd_inputdate(String prd_inputdate) {
		this.prd_inputdate = prd_inputdate;
	}
	public String getImg_1() {
		return img_1;
	}
	public void setImg_1(String img_1) {
		this.img_1 = img_1;
	}
	public String getImg_2() {
		return img_2;
	}
	public void setImg_2(String img_2) {
		this.img_2 = img_2;
	}
	public String getImg_3() {
		return img_3;
	}
	public void setImg_3(String img_3) {
		this.img_3 = img_3;
	}
	public String getColor_detail() {
		return color_detail;
	}
	public void setColor_detail(String color_detail) {
		this.color_detail = color_detail;
	}
	public String getModel_brand() {
		return model_brand;
	}
	public void setModel_brand(String model_brand) {
		this.model_brand = model_brand;
	}
	public String getModel_machine() {
		return model_machine;
	}
	public void setModel_machine(String model_machine) {
		this.model_machine = model_machine;
	}
	@Override
	public String toString() {
		return "ProductVO [prd_no=" + prd_no + ", prd_name=" + prd_name + ", prd_manufacturer=" + prd_manufacturer
				+ ", prd_origine=" + prd_origine + ", prd_display=" + prd_display + ", prd_prcprice=" + prd_prcprice
				+ ", prd_orgprice=" + prd_orgprice + ", prd_saleprice=" + prd_saleprice + ", prd_desc=" + prd_desc
				+ ", prd_inputdate=" + prd_inputdate + ", option_color=" + option_color + ", option_brand="
				+ option_brand + ", img_no=" + img_no + ", file1=" + file1 + ", img_1=" + img_1 + ", file2=" + file2
				+ ", img_2=" + img_2 + ", file3=" + file3 + ", img_3=" + img_3 + ", options=" + options + ", model="
				+ model + ", model_no=" + model_no + ", color=" + color + ", color_no=" + color_no + ", prd_d_stock="
				+ prd_d_stock + ", prd_d_display=" + prd_d_display + ", prd_d_no=" + prd_d_no + ", color_detail="
				+ color_detail + ", model_brand=" + model_brand + ", model_machine=" + model_machine + "]";
	}	
}
