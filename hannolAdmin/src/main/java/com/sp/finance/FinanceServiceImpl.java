package com.sp.finance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("finance.financeService")
public class FinanceServiceImpl implements FinanceService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Finance> getSalePayment(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getSalePayment",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getExpenseRepair(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getExpenseRepair",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getExpenseGoodsIn(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getExpenseGoodsIn",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getYears() throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getYears");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
