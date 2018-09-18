package com.sp.ticket;

public class Ticket {
	private long gubunCode;
	private String gubunName;
	private long goodsCode;
	private String goodsName;
	private int goodsPrice;
	private int quantity;
	private int parentCode;
	private int state; // 0:비활성 1:활성
	private String content;

	public long getGubunCode() {
		return gubunCode;
	}

	public void setGubunCode(long gubunCode) {
		this.gubunCode = gubunCode;
	}

	public String getGubunName() {
		return gubunName;
	}

	public void setGubunName(String gubunName) {
		this.gubunName = gubunName;
	}

	public long getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(long goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getParentCode() {
		return parentCode;
	}

	public void setParentCode(int parentCode) {
		this.parentCode = parentCode;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
