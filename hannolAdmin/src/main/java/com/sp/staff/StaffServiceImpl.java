package com.sp.staff;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class StaffServiceImpl implements StaffService {
	@Autowired
	private CommonDAO  dao;

	@Override
	public Staff loginStaff(String staffId) {
		Staff dto=null;
		
		try {
			dto=dao.selectOne("staff.loginStaff", staffId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
}
