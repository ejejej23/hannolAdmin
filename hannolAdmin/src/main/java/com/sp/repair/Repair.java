package com.sp.repair;

public class Repair {
	private int repairCode;		//수리코드
	private String repairDate; 	//수리일자
	private String memo;		//설명
	private int cost;			//비용
	private int state;			//상태
	private int facilityCode;	//시설코드
	private int companyCode;	//업체코드

	
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

	public int getFacilityCode() {
		return facilityCode;
	}

	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}

	public int getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}
}
