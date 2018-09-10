package com.sp.staff;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;


@Service("member.memberService")
public class StaffServiceImpl implements StaffService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Staff loginStaff(String staffId) {
		Staff dto = null;

		try {
			dto = dao.selectOne("staff.loginStaff", staffId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	@Override
	public boolean amIAdmin(long usersCode) {
		boolean amIAdmin = false;
		try {
			int temp = dao.selectOne("staff.amIAdmin", usersCode);
			if (temp == 0) {
				amIAdmin = false;
			} else {
				amIAdmin = true;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return amIAdmin;
	}

}
