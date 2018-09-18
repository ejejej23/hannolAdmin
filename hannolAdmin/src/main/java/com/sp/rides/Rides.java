package com.sp.rides;

public class Rides {
	int boardingTime;
	int passengers;
	int minHeight;
	int maxHeight;
	int congestion;
	String limit;
	int state;
	int genreCode;
	int gubunCode;//상태구분코드(고장, 수리중, 우천...)

	int ridesInfoCode;
	private long usersCode;
	int facilityCode;
	String gubunName;
	String name;
	int listNum;
	String themeName;
	String genreName;
	
	public int getRidesInfoCode() {
		return ridesInfoCode;
	}
	public void setRidesInfoCode(int ridesInfoCode) {
		this.ridesInfoCode = ridesInfoCode;
	}
	public int getGubunCode() {
		return gubunCode;
	}
	public void setGubunCode(int gubunCode) {
		this.gubunCode = gubunCode;
	}
	public long getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}
	public String getGubunName() {
		return gubunName;
	}
	public void setGubunName(String gubunName) {
		this.gubunName = gubunName;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	public String getThemeName() {
		return themeName;
	}
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}
	public int getBoardingTime() {
		return boardingTime;
	}
	public void setBoardingTime(int boardingTime) {
		this.boardingTime = boardingTime;
	}
	public int getPassengers() {
		return passengers;
	}
	public void setPassengers(int passengers) {
		this.passengers = passengers;
	}
	public int getMinHeight() {
		return minHeight;
	}
	public void setMinHeight(int minHeight) {
		this.minHeight = minHeight;
	}
	public int getMaxHeight() {
		return maxHeight;
	}
	public void setMaxHeight(int maxHeight) {
		this.maxHeight = maxHeight;
	}
	public String getLimit() {
		return limit;
	}
	public void setLimit(String limit) {
		this.limit = limit;
	}
	public int getCongestion() {
		return congestion;
	}
	public void setCongestion(int congestion) {
		this.congestion = congestion;
	}
	public int getGenreCode() {
		return genreCode;
	}
	public void setGenreCode(int genreCode) {
		this.genreCode = genreCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
