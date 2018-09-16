package com.sp.maintenance;

import java.util.List;
import java.util.Map;

public interface InspectionService {
	public int insertInspection(Inspection dto);
	public List<Map<String, Object>> listFacGubun();
	public List<Map<String, Object>> listFacility(int gubunCode);
	public int dataCount(Map<String, Object> map);
	public List<Inspection> listInspection(Map<String, Object> map);
	public Inspection readInspection(int num);
}
