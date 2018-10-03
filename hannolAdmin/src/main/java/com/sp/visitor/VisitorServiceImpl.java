package com.sp.visitor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("visitor.visitorService")
public class VisitorServiceImpl implements VisitorService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Visitor> getYears() throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.getYears");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Visitor> getVisitor(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.getVisitor",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Visitor> getVisitorA(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.getVisitorA",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Visitor> getVisitorN(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.getVisitorN",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Visitor> getVisitorY(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.getVisitorY",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Visitor> visitorLinePeriod(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.visitorLinePeriod",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Visitor> visitorALinePeriod(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.visitorALinePeriod",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Visitor> visitorNLinePeriod(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.visitorNLinePeriod",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Visitor> visitorYLinePeriod(Map<String, Object> map) throws Exception {
		List<Visitor> list = null;
		try {
			list = dao.selectList("visitor.visitorYLinePeriod",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
