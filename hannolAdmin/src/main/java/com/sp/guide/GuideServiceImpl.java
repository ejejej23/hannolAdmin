package com.sp.guide;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("guide.guideService")
public class GuideServiceImpl implements GuideService{
	@Autowired
	CommonDAO dao;

	@Override
	public List<Guide> staffList() {
		List<Guide> list=null;
		try {
			list = dao.selectList("guide.staffList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
