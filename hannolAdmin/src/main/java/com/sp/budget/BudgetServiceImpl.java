package com.sp.budget;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("budget.budgetService")
public class BudgetServiceImpl implements BudgetService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("budget.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Budget readBudget(Map<String, Object> map) throws Exception {
		Budget dto = null;
		try {
			dto = dao.selectOne("budget.readBudget", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<Budget> listBudget(Map<String, Object> map) throws Exception {
		List<Budget> list = null;
		try {
			list = dao.selectList("budget.listBudget", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateBudget(Budget dto) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("budget.updateBudget", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
