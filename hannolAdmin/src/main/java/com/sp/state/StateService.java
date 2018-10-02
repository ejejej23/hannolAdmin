package com.sp.state;

import java.util.List;

import com.sp.facility.Facility;

public interface StateService {
	public List<Facility> checkList(int themeCode);
	public String checkName(int themeCode);
	public int insertState(Facility dto);
	public Facility list(Facility dto);
	public Facility calcul(Facility dto);
}
