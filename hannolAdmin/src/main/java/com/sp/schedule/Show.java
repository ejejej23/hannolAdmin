package com.sp.schedule;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Show {
	private int listNum;
	private int showCode;
	private int facilityCode;
	private int gubunCode;
	private int showInfoCode;
	private String gubunName;
	private String showName;
	private String memo;
	private String originalFilename;
	private String saveFilename;
	private String startdate;
	private String enddate;
	private String runningTime;
	private String name;	// facility
	private MultipartFile upload;
	private List<String> showTime; 
	
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getShowInfoCode() {
		return showInfoCode;
	}
	public void setShowInfoCode(int showInfoCode) {
		this.showInfoCode = showInfoCode;
	}
	public int getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getShowCode() {
		return showCode;
	}
	public void setShowCode(int showCode) {
		this.showCode = showCode;
	}
	public int getGubunCode() {
		return gubunCode;
	}
	public void setGubunCode(int gubunCode) {
		this.gubunCode = gubunCode;
	}
	public String getGubunName() {
		return gubunName;
	}
	public void setGubunName(String gubunName) {
		this.gubunName = gubunName;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public List<String> getShowTime() {
		return showTime;
	}
	public void setShowTime(List<String> showTime) {
		this.showTime = showTime;
	}
}
