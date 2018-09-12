package com.sp.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("schedule.showService")
public class ShowServiceImpl implements ShowService {

	@Autowired
	private CommonDAO dao;


	@Override
	public int insertShow(Show dto, String pathname) throws Exception {
		 
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		 
		return 0;
	}

	@Override
	public List<Show> listShow(Map<String, Object> map) throws Exception {
		 
		return null;
	}

	@Override
	public Show readShow(int showCode) throws Exception {
		 
		return null;
	}

	@Override
	public int updateShow(Show dto, String pathname) throws Exception {
		 
		return 0;
	}

}
