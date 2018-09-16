package com.sp.facility;

import java.util.List;
import java.util.Map;

public interface FacilityService {
	public int insertFacility(Facility dto);
	public int updateFacility(Facility dto);
	public int deleteFacility(int num);
	public List<Facility> listFacility(Map<String,Object> map);
	public int dataCount(Map<String,Object> map);
	public Facility readFacility(int num);
}
