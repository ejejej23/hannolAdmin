package com.sp.staff;

public interface StaffService {
	public Staff loginStaff(String staffId);
	public boolean amIAdmin(long usersCode);
	
	
/*	public int insertMember(Member dto);
	
	public int updateMembership(Map<String, Object> map);
	public int updateLastLogin(String userId);
	public int updateMember(Member dto);
	
	public Member readMember(String userId);
	public Member readMember(long memberIdx);
	
	public int deleteMember(Map<String, Object> map);
	
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);*/
}
