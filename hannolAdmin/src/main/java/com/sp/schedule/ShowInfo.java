package com.sp.schedule;

import java.util.List;

public class ShowInfo {
	int showInfoCode;
	int showCode;
	int facilityCode;
	String name;
	String startDate;
	String endDate;
	String runningTime;
	List<ShowSchedule> showScheduleList;
	List<String> showTime;
	
	public List<String> getShowTime() {
		return showTime;
	}
	public void setShowTime(List<String> showTime) {
		this.showTime = showTime;
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
	public int getShowCode() {
		return showCode;
	}
	public void setShowCode(int showCode) {
		this.showCode = showCode;
	}
	public int getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
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
	public String getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}
	public List<ShowSchedule> getShowScheduleList() {
		return showScheduleList;
	}
	public void setShowScheduleList(List<ShowSchedule> showScheduleList) {
		this.showScheduleList = showScheduleList;
	}
}
