package com.sp.staff;

import java.util.List;
import java.util.Map;

public interface StaffService {
	public Staff loginStaff(String staffId);
	public boolean amIAdmin(long usersCode);
	
	public int dataCount(Map<String, Object> map);
	public Staff readStaff(Map<String, Object> map);
	public List<Staff> listStaff(Map<String, Object> map);
	public int updateStaff(Staff dto);
	public int updateUsersAuth(Map<String, Object> map);
	public int updateStaffAuth(Map<String, Object> map);
	
	public int readTheme(Map<String, Object> map);
	public int readDepart(Map<String, Object> map);
	public int readPosition(Map<String, Object> map);
}
