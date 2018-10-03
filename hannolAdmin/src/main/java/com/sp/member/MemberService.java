package com.sp.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public int dataCount() throws Exception;
	public List<Member> list(Map<String, Object> map) throws Exception;
	public Member readMember(int usersCode) throws Exception;
}
