package com.sp.rides.main;

import java.util.List;
import java.util.Map;

public interface RidesMainService {
	public List<RidesMain> themaGubun() throws Exception;
	public List<RidesMain> yearsList(Map<String, Object> map) throws Exception;
	public List<RidesMain> getVisitorAll(Map<String, Object> map) throws Exception;
	public List<RidesMain> ridesList(Map<String, Object> map) throws Exception;
	public List<RidesMain> getVisitorRides(Map<String, Object> map) throws Exception;
	public List<RidesMain> getThemeQuarter(Map<String, Object> map) throws Exception;
	public List<RidesMain> getThemeMonth(Map<String, Object> map) throws Exception;
	public int dataCountRides(int themeCode) throws Exception;
}
