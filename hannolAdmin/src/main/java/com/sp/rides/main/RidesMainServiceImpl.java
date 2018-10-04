package com.sp.rides.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("main.ridesMainService")
public class RidesMainServiceImpl implements RidesMainService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<RidesMain> themaGubun() throws Exception {
		List<RidesMain> list = null;
		try {
			list = dao.selectList("ridemain.themaList");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<RidesMain> yearsList(Map<String, Object> map) throws Exception {
		List<RidesMain> list = null;
		try {
			list = dao.selectList("ridemain.getYears", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<RidesMain> getVisitorAll(Map<String, Object> map) throws Exception {
		List<RidesMain> list = null;
		try {
			list = dao.selectList("ridemain.getvisitorALL", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}
