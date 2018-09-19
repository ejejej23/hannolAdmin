package com.sp.repair;

public class Repair {
	private int listNum; 		//리스트번호
	private int repairCode; 	//수리코드
	private String repairDate; 	//수리일자
	private String memo; 		//설명
	private int cost; 			//비용
	private int state; 			//상태
	private int gubunCode; 		//시설코드
	private String facGubunName;//시설이름
	private int facilityCode; 	//시설코드
	private String facilityName;//시설이름
	private int companyCode; 	//업체코드
	private String companyName; //업체이름

	
	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getRepairCode() {
		return repairCode;
	}

	public void setRepairCode(int repairCode) {
		this.repairCode = repairCode;
	}

	public String getRepairDate() {
		return repairDate;
	}

	public void setRepairDate(String repairDate) {
		this.repairDate = repairDate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
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
}
