package com.sp.reservation;

import java.util.List;

public class ShowReservation {
	private int showBookCode;
	private String bookDate;
	private String memberName;
	private String tel;
	private List<String> seatNum;
	
	public int getShowBookCode() {
		return showBookCode;
	}
	public void setShowBookCode(int showBookCode) {
		this.showBookCode = showBookCode;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public List<String> getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(List<String> seatNum) {
		this.seatNum = seatNum;
	}
}
