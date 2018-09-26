package com.sp.goodsIn;

public class GoodsIn {
	private int listNum; 		// 글번호
	private int inCode; 		// 입고코드
	private String inDate; 		// 입고일자
	private int quantity; 		// 입고수량
	private int totalCount; 	// 입고후 총 수량
	private int unitPrice; 		// 구입단가
	private int totalPrice; 	// 총 가격
	private String memo; 		// 비고
	
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

	public int getInCode() {
		return inCode;
	}

	public void setInCode(int inCode) {
		this.inCode = inCode;
	}

	public String getInDate() {
		return inDate;
	}

	public void setInDate(String inDate) {
		this.inDate = inDate;
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

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
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

