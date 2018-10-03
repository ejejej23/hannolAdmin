package com.sp.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("memberlist.memberlistService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount() throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("member.dataCount");
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Member> list(Map<String, Object> map) throws Exception {
		List<Member> list = null;
		try {
			list = dao.selectList("member.list", map);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Member readMember(int usersCode) throws Exception {
		Member dto = null;
		try {
			dto = dao.selectOne("member.readMember", usersCode);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
