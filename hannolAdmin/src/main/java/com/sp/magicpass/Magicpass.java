package com.sp.magicpass;

import java.util.List;

public class Magicpass {
	private long mpCode;
	private long facilityCode;
	private String name;
	private long ticketCode;
	private long usersCode;
	private int mpTime;
	private String mpDate;
	private int state; // 0: 사용가능, 1: 사용불가
	private List<Long> mpCodes;

	public long getMpCode() {
		return mpCode;
	}

	public List<Long> getMpCodes() {
		return mpCodes;
	}

	public void setMpCodes(List<Long> mpCodes) {
		this.mpCodes = mpCodes;
	}

	public void setMpCode(long mpCode) {
		this.mpCode = mpCode;
	}

	public long getFacilityCode() {
		return facilityCode;
	}

	public void setFacilityCode(long facilityCode) {
		this.facilityCode = facilityCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getTicketCode() {
		return ticketCode;
	}

	public void setTicketCode(long ticketCode) {
		this.ticketCode = ticketCode;
	}

	public long getUsersCode() {
		return usersCode;
	}

	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}

	public int getMpTime() {
		return mpTime;
	}

	public void setMpTime(int mpTime) {
		this.mpTime = mpTime;
	}

	public String getMpDate() {
		return mpDate;
	}

	public void setMpDate(String mpDate) {
		this.mpDate = mpDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
