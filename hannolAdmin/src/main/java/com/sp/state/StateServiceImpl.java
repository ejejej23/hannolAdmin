package com.sp.state;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.facility.Facility;

@Service("state.stateService")
public class StateServiceImpl implements StateService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Facility> checkList(int themeCode) {
		List<Facility> list = null;
		
		try {
			list = dao.selectList("state.checkList", themeCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public String checkName(int themeCode) {
		String themeName=null;
		
		try {
			themeName=dao.selectOne("state.checkName", themeCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return themeName;
	}

	@Override
	public int insertState(Facility dto) {
		int result =0 ;
		
		try {
			result=dao.insertData("state.insertState",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Facility list(Facility dto) {
		Facility  dto1 = new Facility();
		
		try {
			dto1 = dao.selectOne("state.list", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto1;
	}

	@Override
	public Facility calcul(Facility dto) {
		try {
			dao.selectOne("state.calcul", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return null;
	}
	

}
