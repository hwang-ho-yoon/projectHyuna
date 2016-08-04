package com.hyuna.vo;

public class CartVO  {
	private int cart_no = 0;			// 장바구니 번호
	private int cart_quantity = 0;		// 수량

	private int prd_d_no;
	private int mem_no;
	
	// 상품값 받아올 수 있는 필드
	private String img_1;
	private String prd_name;
	private int prd_saleprice;
	private String model_machine;
	private String color_detail;
	private int prd_no;
	
	
	public int getPrd_no() {
		return prd_no;
	}

	public void setPrd_no(int prd_no) {
		this.prd_no = prd_no;
	}

		//추가--pjs
		private int model_no;
		private int color_no;
		public int getModel_no() {
			return model_no;
		}

		public void setModel_no(int model_no) {
			this.model_no = model_no;
		}

		public int getColor_no() {
			return color_no;
		}

		public void setColor_no(int color_no) {
			this.color_no = color_no;
		}
		//추가--pjs
	
	public String getModel_machine() {
		return model_machine;
	}

	public void setModel_machine(String model_machine) {
		this.model_machine = model_machine;
	}

	public String getColor_detail() {
		return color_detail;
	}

	public void setColor_detail(String color_detail) {
		this.color_detail = color_detail;
	}

	public String getPrd_name() {
		return prd_name;
	}

	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}

	public int getPrd_saleprice() {
		return prd_saleprice;
	}

	public void setPrd_saleprice(int prd_saleprice) {
		this.prd_saleprice = prd_saleprice;
	}

	public String getImg_1() {
		return img_1;
	}

	public void setImg_1(String img_1) {
		this.img_1 = img_1;
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

	public int getCart_no() {
		return cart_no;
	}
	
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	
	public int getCart_quantity() {
		return cart_quantity;
	}
	
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}	
}
