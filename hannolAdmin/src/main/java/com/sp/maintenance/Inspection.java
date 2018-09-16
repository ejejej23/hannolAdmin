package com.sp.maintenance;

public class Inspection {
	private int listNum;		//리스트 번호
	private int checkCode;		//점검 코드
	private String checkDate;	//점검 일자
	private String memo;  		//설명
	private int state;  		//상태
	private int gubunCode; 		//구분코드
	private String facGubunName;//구분이름
	private int facilityCode; 	//시설코드
	private String facilityName;//시설이름

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(int checkCode) {
		this.checkCode = checkCode;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
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

	public int getGubunCode() {
		return gubunCode;
	}

	public void setGubunCode(int gubunCode) {
		this.gubunCode = gubunCode;
	}

	public String getFacGubunName() {
		return facGubunName;
	}

	public void setFacGubunName(String facGubunName) {
		this.facGubunName = facGubunName;
	}

	public int getFacilityCode() {
		return facilityCode;
	}

	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}

	public String getFacilityName() {
		return facilityName;
	}

	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}
}
