package com.sp.staff;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class StaffServiceImpl implements StaffService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Staff loginStaff(String staffId) throws Exception {
		Staff dto = null;

		try {
			dto = dao.selectOne("staff.loginStaff", staffId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	@Override
	public boolean amIAdmin(long usersCode) throws Exception {
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

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("staff.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Staff readStaff(int usersCode) throws Exception {
		Staff dto = null;
		try {
			dto = dao.selectOne("staff.readStaff", usersCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<Staff> listStaff(Map<String, Object> map) throws Exception {
		List<Staff> list = null;
		try {
			list = dao.selectList("staff.listStaff", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateStaff(Staff dto) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("staff.updateStaff", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateStaffAuth(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			
			dao.updateData("staff.updateStaffAuth", map);
			dao.updateData("staff.updateUsersAuth", map);
			
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int readTheme(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("staff.readTheme", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int readDepart(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("staff.readDepart", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int readPosition(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("staff.readPosition", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int inoutStaff(Map<String, Object> map) throws Exception {
		int result =0;
		try {
			result = dao.updateData("staff.inoutStaff", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
