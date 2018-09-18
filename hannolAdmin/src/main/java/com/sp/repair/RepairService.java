package com.sp.repair;

import java.util.List;
import java.util.Map;

public interface RepairService {
	public int insertRepair(Repair dto);
	public int dataCount(Map<String, Object> map);
	public List<Repair> listRepair(Map<String, Object> map);
	public Repair readRepair(int num);
	public int updateRepair(Repair dto);
	public int deleteRepair(int num);
}
