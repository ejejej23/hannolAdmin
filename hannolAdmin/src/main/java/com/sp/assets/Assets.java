package com.sp.assets;

public class Assets {
	private int bookCode; 		//예약코드
	private String bookDate;	//예약날짜
	private String useDate;		//사용예정일
	private int bookTime;		//예약시간(오후/종일)
	private String tel;			//전화번호(예약자)
	private String tel1;
	private String tel2;
	private String tel3;
	private String memberId;	//아이디
	private String name;		//이름(예약자)
	private int usersCode;		//유저코드
	private int assetsCode;		//자산코드
	
	private int state; 			//상태
	private int facilityCode; 	//시설 코드
	private String facilityName;//시설 이름
	private int totalCount; 	//총 수량  
	private int rentCount; 		//대여 수량  
	

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

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public int getBookTime() {
		return bookTime;
	}

	public void setBookTime(int bookTime) {
		this.bookTime = bookTime;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUsersCode() {
		return usersCode;
	}

	public void setUsersCode(int usersCode) {
		this.usersCode = usersCode;
	}

	public int getAssetsCode() {
		return assetsCode;
	}

	public void setAssetsCode(int assetsCode) {
		this.assetsCode = assetsCode;
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

	public String getFacilityName() {
		return facilityName;
	}

	public void setFacilityName(String facilityName) {
		this.facilityName = facilityName;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getRentCount() {
		return rentCount;
	}

	public void setRentCount(int rentCount) {
		this.rentCount = rentCount;
	}	
}
