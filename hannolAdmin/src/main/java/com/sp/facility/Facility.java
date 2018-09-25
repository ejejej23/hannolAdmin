package com.sp.facility;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Facility {
	private long usersCode;
	int facilityCode;
	String name;
	int state;
	String installDate;
	String removeDate;
	String saveMainFilename;
	String originalMainFilename;
	String saveLocFilename;
	String originalLocFilename;
	String memo;
	int gubunCode;
	String gubunName;
	int themeCode;
	int listNum;
	String themeName;
	private MultipartFile upload1;
	private MultipartFile upload2;
	Date recordDate;
	int timezone;
	int waiting;
	int boarding;

	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public int gettimezone() {
		return timezone;
	}
	public void settimezone(int timezone) {
		this.timezone = timezone;
	}
	public int getWaiting() {
		return waiting;
	}
	public void setWaiting(int waiting) {
		this.waiting = waiting;
	}
	public int getBoarding() {
		return boarding;
	}
	public void setBoarding(int boarding) {
		this.boarding = boarding;
	}
	public String getGubunName() {
		return gubunName;
	}
	public void setGubunName(String gubunName) {
		this.gubunName = gubunName;
	}
	public long getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}
	public String getThemeName() {
		return themeName;
	}
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
	}
	public MultipartFile getUpload1() {
		return upload1;
	}
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getInstallDate() {
		return installDate;
	}
	public void setInstallDate(String installDate) {
		this.installDate = installDate;
	}
	public String getRemoveDate() {
		return removeDate;
	}
	public void setRemoveDate(String removeDate) {
		this.removeDate = removeDate;
	}
	public String getSaveMainFilename() {
		return saveMainFilename;
	}
	public void setSaveMainFilename(String saveMainFilename) {
		this.saveMainFilename = saveMainFilename;
	}
	public String getOriginalMainFilename() {
		return originalMainFilename;
	}
	public void setOriginalMainFilename(String originalMainFilename) {
		this.originalMainFilename = originalMainFilename;
	}
	public String getSaveLocFilename() {
		return saveLocFilename;
	}
	public void setSaveLocFilename(String saveLocFilename) {
		this.saveLocFilename = saveLocFilename;
	}
	public String getOriginalLocFilename() {
		return originalLocFilename;
	}
	public void setOriginalLocFilename(String originalLocFilename) {
		this.originalLocFilename = originalLocFilename;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getGubunCode() {
		return gubunCode;
	}
	public void setGubunCode(int gubunCode) {
		this.gubunCode = gubunCode;
	}
	public int getThemeCode() {
		return themeCode;
	}
	public void setThemeCode(int themeCode) {
		this.themeCode = themeCode;
	}
	
	
}
