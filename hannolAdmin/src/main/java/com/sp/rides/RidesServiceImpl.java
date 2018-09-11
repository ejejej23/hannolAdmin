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
			dao.insertData("rides.insertRides",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateRides(Rides dto) {
		// TODO Auto-generated method stub
		return 0;
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
			dto=dao.selectOne("rides.readRides",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
