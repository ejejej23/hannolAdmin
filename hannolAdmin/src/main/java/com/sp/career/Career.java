package com.sp.career;

public class Career {
//발령처리하고 로그쌓기
	private int listNum;
	private long usersCode;
	private Integer careerCode;
	private Integer dpCode;
	private Integer positionCode;
	private Integer themeCode;
	
	private String dpName;
	private String positionName;
	private String themeName;

	private String careerDate;
	private String memo;
	private String ememo;
	
	private String name;
	private String task;
	
	
	//입퇴사 테이블자료도 필요함
	private int epCode;
	private int gubun;
	private String memoInout;
	private String epDate;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public long getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}
	public Integer getCareerCode() {
		return careerCode;
	}
	public void setCareerCode(Integer careerCode) {
		this.careerCode = careerCode;
	}
	public Integer getDpCode() {
		return dpCode;
	}
	public void setDpCode(Integer dpCode) {
		this.dpCode = dpCode;
	}
	public Integer getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(Integer positionCode) {
		this.positionCode = positionCode;
	}
	public Integer getThemeCode() {
		return themeCode;
	}
	public void setThemeCode(Integer themeCode) {
		this.themeCode = themeCode;
	}
	public String getDpName() {
		return dpName;
	}
	public void setDpName(String dpName) {
		this.dpName = dpName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getThemeName() {
		return themeName;
	}
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
	public String getCareerDate() {
		return careerDate;
	}
	public void setCareerDate(String careerDate) {
		this.careerDate = careerDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getEmemo() {
		return ememo;
	}
	public void setEmemo(String ememo) {
		this.ememo = ememo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public int getEpCode() {
		return epCode;
	}
	public void setEpCode(int epCode) {
		this.epCode = epCode;
	}
	public int getGubun() {
		return gubun;
	}
	public void setGubun(int gubun) {
		this.gubun = gubun;
	}
	public String getMemoInout() {
		return memoInout;
	}
	public void setMemoInout(String memoInout) {
		this.memoInout = memoInout;
	}
	public String getEpDate() {
		return epDate;
	}
	public void setEpDate(String epDate) {
		this.epDate = epDate;
	}
	
	
}
