package com.sp.staff;

import java.util.List;
import java.util.Map;

public interface StaffService {
	public Staff loginStaff(String staffId) throws Exception;
	public boolean amIAdmin(long usersCode) throws Exception;
	
	public int dataCount(Map<String, Object> map) throws Exception;
	public Staff readStaff(int usersCode) throws Exception;
	public List<Staff> listStaff(Map<String, Object> map) throws Exception;
	
	public int updateStaff(Staff dto) throws Exception;
	public int updateStaffAuth(Map<String, Object> map) throws Exception;
	
	public int insertInoutStaff(Map<String, Object> map) throws Exception;
	
	public int updatePwd(Staff dto) throws Exception;
	
	//이거 커리어쪽에 필요한거아냐???
	public int readTheme(Map<String, Object> map) throws Exception;
	public int readDepart(Map<String, Object> map) throws Exception;
	public int readPosition(Map<String, Object> map) throws Exception;
}
