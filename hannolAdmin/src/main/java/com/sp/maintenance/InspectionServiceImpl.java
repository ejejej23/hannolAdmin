package com.sp.maintenance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service
public class InspectionServiceImpl implements InspectionService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertInspection(Inspection dto) {
		int result = 0;
		
		try {
			result = dao.insertData("inspection.insertInspection", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> listFacGubun() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("inspection.listFacGubun");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listFacility(int gubunCode) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("inspection.listFacility", gubunCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("inspection.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Inspection> listInspection(Map<String, Object> map) {
		List<Inspection> list = null;
		
		try {
			list = dao.selectList("inspection.listInspection", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Inspection readInspection(int num) {
		Inspection dto = null;
		
		try {
			dto = dao.selectOne("inspection.readInspection", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateInspection(Inspection dto) {
		int result = 0;
		
		try {
			result = dao.updateData("inspection.updateInspection", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteInspection(int num) {
		int result = 0;
		
		try {
			result = dao.deleteData("inspection.deleteInspection", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
