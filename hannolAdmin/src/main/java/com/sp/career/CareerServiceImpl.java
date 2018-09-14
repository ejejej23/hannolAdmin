package com.sp.career;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("career.careerService")
public class CareerServiceImpl implements CareerService {
	@Autowired
	CommonDAO dao;

	@Override
	public Career readCareer(Map<String, Object> map)  throws Exception{
		Career dto=null;
		try {
			dto = dao.selectOne("career.readCareer", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<Career> listCareer(Map<String, Object> map)  throws Exception{
		List<Career> list=null;
		try {
			list = dao.selectList("career.listCareer", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertCareer(Career dto)  throws Exception{
		int result =0;
		try {
			result = dao.insertData("career.insertCareer", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public int updateCareer(Career dto)  throws Exception{
		int result =0;
		try {
			result = dao.updateData("career.updateCareer", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteCareer(int usersCode) throws Exception {
		int result =0;
		try {
			result = dao.deleteData("career.deleteCareer", usersCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result =0;
		try {
			result = dao.selectOne("career.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateTheme(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("career.updateTheme", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public String selectThemeName(int themeCode) throws Exception {
		String result =null;
		try {
			result=dao.selectOne("career.selectThemeName", themeCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
