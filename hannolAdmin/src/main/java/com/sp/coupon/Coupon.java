package com.sp.coupon;

public class Coupon {
	// 쿠폰발송내역컬럼
	private long mngCode;
	private String mngName;
	private String mngDate;
	private String usersGubun;
	private int userGubun;

	// 쿠폰발급컬럼
	private long couponCode;
	private String issuedDate;
	private String startDate;
	private String endDate;
	private String memo;
	private int state;
	private long goodsCode;
	private long usersCode;

	private int count;

	private int listNum;

	public int getUserGubun() {
		return userGubun;
	}

	public void setUserGubun(int userGubun) {
		this.userGubun = userGubun;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getUsersGubun() {
		return usersGubun;
	}

	public void setUsersGubun(String usersGubun) {
		this.usersGubun = usersGubun;
	}

	public long getMngCode() {
		return mngCode;
	}

	public void setMngCode(long mngCode) {
		this.mngCode = mngCode;
	}

	public String getMngName() {
		return mngName;
	}

	public void setMngName(String mngName) {
		this.mngName = mngName;
	}

	public String getMngDate() {
		return mngDate;
	}

	public void setMngDate(String mngDate) {
		this.mngDate = mngDate;
	}

	public long getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(long couponCode) {
		this.couponCode = couponCode;
	}

	public String getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(String issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public long getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(long goodsCode) {
		this.goodsCode = goodsCode;
	}

	public long getUsersCode() {
		return usersCode;
	}

	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}
}
