package com.sp.finance;

import java.util.List;

public interface FinanceService {
	public List<Finance> getSalePaymentQuarter() throws Exception;
	public List<Finance> getExpenseRepairQuarter() throws Exception;
	public List<Finance> getExpenseGoodsInQuarter() throws Exception;
}
