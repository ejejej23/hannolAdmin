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

	@Override
	public List<Finance> getYearsPayment() throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getYearsPayment");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getYearsLoss() throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getYearsLoss");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Finance> profitLinePeriod(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.profitLinePeriod",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> expenseRepairPeriod(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.expenseRepairPeriod",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> expenseGoodsInPeriod(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.expenseGoodsInPeriod",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getProfitData(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getProfitData",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Finance> getLossGoodsData(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getLossGoodsData",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Finance> getLossRepairData(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getLossRepairData",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Finance> getLossDiscountData(Map<String, Object> map) throws Exception {
		List<Finance> list = null;
		try {
			list = dao.selectList("finance.getLossDiscountData",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
