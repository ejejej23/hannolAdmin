package com.sp.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("company.companyServiceImpl")
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertCompany(Company dto){
		int result = 0;
		
		try {
			result = dao.insertData("company.insertCompany", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("company.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Company> listCompany(Map<String, Object> map) {
		List<Company> list = null;
		
		try {
			list = dao.selectList("company.listCompany", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
