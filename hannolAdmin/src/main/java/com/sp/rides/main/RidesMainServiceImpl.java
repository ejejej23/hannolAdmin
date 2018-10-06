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

	@Override
	public List<RidesMain> ridesList(Map<String, Object> map) throws Exception {
		List<RidesMain> list = null;
		try {
			list = dao.selectList("ridemain.ridesList", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<RidesMain> getVisitorRides(Map<String, Object> map) throws Exception {
		List<RidesMain> list = null;
		try {
			list = dao.selectList("ridemain.getvisitorRides", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int dataCountRides(int themeCode) throws Exception {
		int result=0;
		try {
			result =dao.selectOne("ridemain.dataCountRides", themeCode);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<RidesMain> getThemeQuarter(Map<String, Object> map) throws Exception {
		List<RidesMain> list = null;
		try {
			list = dao.selectList("ridemain.getThemeQuarter", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<RidesMain> getThemeMonth(Map<String, Object> map) throws Exception {
		List<RidesMain> list = null;
		try {
			list = dao.selectList("ridemain.getThemeMonth", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}
