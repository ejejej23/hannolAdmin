package com.sp.rides;

import java.util.List;
import java.util.Map;

public interface RidesService {
	public int insertRides(Rides dto);
	public int insertRidesInfo(Rides dto);
	public int updateRides(Rides dto);
	public int updateInfoRides(Rides dto);
	public int updateRidesChg(Rides dto);
	public int deleteRides(int num);
	public List<Rides> listName(Map<String,Object> map);
	public List<Rides> listRides(Map<String,Object> map);
	public List<Rides> InfolistRides(Map<String,Object> map);
	public int dataCount(Map<String,Object> map);
	public int InfodataCount(Map<String,Object> map);
	public Rides readRides(int num);
}
