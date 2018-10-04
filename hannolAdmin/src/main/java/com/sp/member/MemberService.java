package com.sp.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Member> list(Map<String, Object> map) throws Exception;
	public Member readMember(int usersCode) throws Exception;
	public List<Member> gradelist() throws Exception;
	public int updateGrade(Map<String, Object> map) throws Exception;
	public int updateEnabled(Map<String, Object> map) throws Exception;
}
