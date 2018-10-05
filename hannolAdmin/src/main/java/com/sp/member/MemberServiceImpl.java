package com.sp.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.grade.Grade;

@Service("memberlist.memberlistService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("member.dataCount", map);
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

	@Override
	public List<Member> gradelist() throws Exception {
		List<Member> list = null;
		try {
			list = dao.selectList("member.gradelist");
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateGrade(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("member.updateGrade", map);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateEnabled(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("member.updateEnabled", map);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public void updateGradeCode() throws Exception {
		try {
			List<Member> list = dao.selectList("member.getUpdateGradeCode");
			for(int i = 0; i<list.size(); i++) {
				dao.updateData("member.updateGradeCode", list.get(i));
			}
		} catch (Exception e) {
		}
	}
}
