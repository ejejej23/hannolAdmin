package com.sp.finance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("finance.financeService")
public class FinanceServiceImpl implements FinanceService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Finance> getSalePaymentQuarter() throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getSalePaymentQuarter");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getExpenseRepairQuarter() throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getExpenseRepairQuarter");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getExpenseGoodsInQuarter() throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getExpenseGoodsInQuarter");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
