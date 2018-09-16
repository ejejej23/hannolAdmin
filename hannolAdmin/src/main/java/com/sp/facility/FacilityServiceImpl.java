package com.sp.facility;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("facility.facilityService")
public class FacilityServiceImpl implements FacilityService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertFacility(Facility dto) {
		int result=0;
		try {
			dao.insertData("facility.insertFacility",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateFacility(Facility dto) {
		int result = 0;
		try {
			System.out.println("update하러 들어왔다~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");

			dao.updateData("facility.updateFacility", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());

		}
		System.out.println("getList간다~~~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");

		return result;
	}

	@Override
	public int deleteFacility(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Facility> listFacility(Map<String, Object> map) {
		List<Facility> list = null;
		try {
			list = dao.selectList("facility.listFacility",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("rides.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Facility readFacility(int num) {
		Facility dto=null;
		try {
			dto=dao.selectOne("facility.readFacility",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
