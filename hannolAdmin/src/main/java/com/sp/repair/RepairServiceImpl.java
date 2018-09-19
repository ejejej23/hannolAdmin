package com.sp.repair;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service
public class RepairServiceImpl implements RepairService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertRepair(Repair dto) {
		int result = 0;
		
		try {
			result = dao.insertData("repair.insertRepair", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> listFacGubun() {
		List<Map<String, Object>> list = null;
				
		try {
			list = dao.selectList("repair.listFacGubun");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listFacility(int gubunCode) {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("repair.listFacility", gubunCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listCompany() {
		List<Map<String, Object>> list = null;
		
		try {
			list = dao.selectList("repair.listCompany");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}	
	

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("repair.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Repair> listRepair(Map<String, Object> map) {
		List<Repair> list = null;
		
		try {
			list = dao.selectList("repair.listRepair", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Repair readRepair(int num) {
		Repair dto = null;
		
		try {
			dto = dao.selectOne("repair.readRepair", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateRepair(Repair dto) {
		int result = 0;
		
		try {
			result = dao.updateData("repair.updateRepair", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteRepair(int num) {
		int result = 0;
		
		try {
			result = dao.deleteData("repair.deleteRepair", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
