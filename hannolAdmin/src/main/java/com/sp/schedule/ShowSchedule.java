package com.sp.schedule;

import java.util.List;

public class ShowSchedule {
	int showCode;
	int showInfoCode;
	int schCode;
	String screenDate;
	List<ShowStartTime> startTime;
	List<String> startTimeList;
	
	public List<String> getStartTimeList() {
		return startTimeList;
	}
	public void setStartTimeList(List<String> startTimeList) {
		this.startTimeList = startTimeList;
	}
	public int getShowCode() {
		return showCode;
	}
	public void setShowCode(int showCode) {
		this.showCode = showCode;
	}
	public int getShowInfoCode() {
		return showInfoCode;
	}
	public void setShowInfoCode(int showInfoCode) {
		this.showInfoCode = showInfoCode;
	}
	public int getSchCode() {
		return schCode;
	}
	public void setSchCode(int schCode) {
		this.schCode = schCode;
	}
	public String getScreenDate() {
		return screenDate;
	}
	public void setScreenDate(String screenDate) {
		this.screenDate = screenDate;
	}
	public List<ShowStartTime> getStartTime() {
		return startTime;
	}
	public void setStartTime(List<ShowStartTime> startTime) {
		this.startTime = startTime;
	}
}
