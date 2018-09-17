package com.sp.schedule;

import java.util.List;

public class ShowSchedule {
	int schCode;
	String screenDate;
	List<ShowStartTime> showStartTimeList;
	
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
	public List<ShowStartTime> getShowStartTimeList() {
		return showStartTimeList;
	}
	public void setShowStartTimeList(List<ShowStartTime> showStartTimeList) {
		this.showStartTimeList = showStartTimeList;
	}
}
