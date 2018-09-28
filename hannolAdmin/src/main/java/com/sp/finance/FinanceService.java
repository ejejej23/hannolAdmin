package com.sp.finance;

import java.util.List;
import java.util.Map;

public interface FinanceService {
	public List<Finance> getYears() throws Exception;
	public List<Finance> getSalePayment(Map<String, Object> map) throws Exception;
	public List<Finance> getExpenseRepair(Map<String, Object> map) throws Exception;
	public List<Finance> getExpenseGoodsIn(Map<String, Object> map) throws Exception;
	public List<Finance> profitLinePeriod(Map<String, Object> map) throws Exception;
}
