package com.sp.guide;

public class Guide {
	private long usersCode;
	private String name;//가이드인 직원 조회해올때 사용
	
	private int schCode;
	private int timezone;
	private String startDate;
	private String endDate;
	private String workDate;
	private String role;
	private String memo;
	
	//예약관련
	private int bookCode;
	private String bookDate;
	private String tel;
	
	//예약자정보
	private String nameM;
	private long usersCodeM;
	
	public long getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSchCode() {
		return schCode;
	}
	public void setSchCode(int schCode) {
		this.schCode = schCode;
	}
	public int getTimezone() {
		return timezone;
	}
	public void setTimezone(int timezone) {
		this.timezone = timezone;
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
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getBookCode() {
		return bookCode;
	}
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getNameM() {
		return nameM;
	}
	public void setNameM(String nameM) {
		this.nameM = nameM;
	}
	public long getUsersCodeM() {
		return usersCodeM;
	}
	public void setUsersCodeM(long usersCodeM) {
		this.usersCodeM = usersCodeM;
	}
	
}
