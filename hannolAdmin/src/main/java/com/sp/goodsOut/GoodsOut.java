package com.sp.goodsOut;

public class GoodsOut {
	private int listNum;	//글번호
	private int outCode;	//출고코드
	private String outDate;	//출고일자
	private int quantity;	//출고수량
	private int totalCount;	//출고후 총 수량
	private int salePrice;	//판매가격
	private String memo;	//비고
	
	private int companyCode;	// 업체코드
	private String companyName;	// 업체이름
	private int goodsCode;		// 상품코드
	private String goodsName; 	// 상품명
	private int gubunCode;		// 구분코드
	private String gubunName;	// 구분이름
	
	private int originQuantity; //기존 총 개수

	
	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getOutCode() {
		return outCode;
	}

	public void setOutCode(int outCode) {
		this.outCode = outCode;
	}

	public String getOutDate() {
		return outDate;
	}

	public void setOutDate(String outDate) {
		this.outDate = outDate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGubunCode() {
		return gubunCode;
	}

	public void setGubunCode(int gubunCode) {
		this.gubunCode = gubunCode;
	}

	public String getGubunName() {
		return gubunName;
	}

	public void setGubunName(String gubunName) {
		this.gubunName = gubunName;
	}

	public int getOriginQuantity() {
		return originQuantity;
	}

	public void setOriginQuantity(int originQuantity) {
		this.originQuantity = originQuantity;
	}
}
