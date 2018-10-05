package com.sp.amenity;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("amenity.amenityService")
public class AmenityServiceImpl implements AmenityService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Amenity> checkList(Map<String, Object> map) {
		List<Amenity> list = null;
		try {
			System.out.println("서비스임플~!!!!!!!!!!!!!!!!!!!!!!!!!");
			list = dao.selectList("amenity.checkList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int datanum(Map<String, Object> map) {
		int result=0;
		
		try {
			result = dao.selectOne("amenity.datanum",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	
}
