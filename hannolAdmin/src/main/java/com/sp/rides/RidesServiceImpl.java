package com.sp.rides;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("rides.ridesService")
public class RidesServiceImpl implements RidesService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertRides(Rides dto) {
		int result=0;
		try {
			result=dao.insertData("rides.insertRides",dto);
			//result=dao.insertData("rides.insertRidesInfo",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		System.out.println(result+"insert결과다 이게~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		return result;
	}

	@Override
	public int updateRides(Rides dto) {
		int result = 0;
		try {
			System.out.println("update하러 들어왔다~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");

			dao.updateData("rides.updateRides", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());

		}
		System.out.println("getList간다~~~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");

		return result;
	}

	@Override
	public int deleteRides(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Rides> listRides(Map<String, Object> map) {
		List<Rides> list = null;
		try {
			list = dao.selectList("rides.listRides",map);
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
	public Rides readRides(int num) {
		Rides dto=null;
		try {
			System.out.println(num+":::::::::::::"+"num값!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			dto=dao.selectOne("rides.readRides",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
