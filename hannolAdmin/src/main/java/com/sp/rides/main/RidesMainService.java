package com.sp.rides.main;

import java.util.List;
import java.util.Map;

public interface RidesMainService {
	public List<RidesMain> themaGubun() throws Exception;
	public List<RidesMain> yearsList(Map<String, Object> map) throws Exception;
	public List<RidesMain> getVisitorAll(Map<String, Object> map) throws Exception;
}
