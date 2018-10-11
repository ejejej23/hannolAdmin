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
		return result;
	}
	
	@Override
	public int insertRidesInfo(Rides dto) {
		int result=0;
		try {
			result=dao.insertData("rides.insertRidesInfo",dto);
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
			dao.updateData("rides.updateRides", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());

		}

		return result;
	}
	
	@Override
	public int updateInfoRides(Rides dto) {
		int result = 0;
		try {
			dao.updateData("rides.updateInfoRides", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
			
		}
		
		return result;
	}
	
	@Override
	public int updateRidesChg(Rides dto) {
		int result = 0;
		try {
			System.out.println("updateChg하러 들어왔다~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");
			dao.updateData("rides.updateRidesChg", dto);
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
	public List<Rides> listName(Map<String, Object> map) {
		List<Rides> list = null;
		try {
			list = dao.selectList("rides.listName",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
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
	public List<Rides> InfolistRides(Map<String, Object> map) {
		List<Rides> list = null;
		try {
			list = dao.selectList("rides.InfolistRides",map);
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
	public int InfodataCount(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("rides.InfodataCount",map);
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
