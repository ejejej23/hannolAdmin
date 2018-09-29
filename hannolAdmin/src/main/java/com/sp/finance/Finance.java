package com.sp.finance;

public class Finance {
	private int saleAmount;
	private int year;
	private int quarter;
	private int month;
	private int day;
	private int rnum;
	
	private String payDate;
	private String repairDate;
	private String inDate;
	
	public String getRepairDate() {
		return repairDate;
	}
	public void setRepairDate(String repairDate) {
		this.repairDate = repairDate;
	}
	public String getInDate() {
		return inDate;
	}
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(int saleAmount) {
		this.saleAmount = saleAmount;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getQuarter() {
		return quarter;
	}
	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}
	
	
}
