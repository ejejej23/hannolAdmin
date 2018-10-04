package com.sp.rides.main;

import java.util.List;

public interface RidesMainService {
	public List<RidesMain> themaGubun() throws Exception;
	public List<RidesMain> yearsList(int thema) throws Exception;
}
