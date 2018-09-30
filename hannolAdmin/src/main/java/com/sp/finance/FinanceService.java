package com.sp.finance;

import java.util.List;
import java.util.Map;

public interface FinanceService {
	public List<Finance> getYears() throws Exception;
	public List<Finance> getYearsPayment() throws Exception;
	public List<Finance> getYearsLoss() throws Exception;
	public List<Finance> getSalePayment(Map<String, Object> map) throws Exception;
	public List<Finance> getExpenseRepair(Map<String, Object> map) throws Exception;
	public List<Finance> getExpenseGoodsIn(Map<String, Object> map) throws Exception;
	public List<Finance> profitLinePeriod(Map<String, Object> map) throws Exception;
	public List<Finance> expenseRepairPeriod(Map<String, Object> map) throws Exception;
	public List<Finance> expenseGoodsInPeriod(Map<String, Object> map) throws Exception;
	
	public List<Finance> getProfitData(Map<String, Object> map) throws Exception;
	public List<Finance> getLossGoodsData(Map<String, Object> map) throws Exception;
	public List<Finance> getLossRepairData(Map<String, Object> map) throws Exception;
	public List<Finance> getLossDiscountData(Map<String, Object> map) throws Exception;
}
