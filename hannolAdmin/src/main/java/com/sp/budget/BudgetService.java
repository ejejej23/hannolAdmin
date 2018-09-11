package com.sp.budget;

import java.util.List;
import java.util.Map;

public interface BudgetService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public Budget readBudget(Map<String, Object> map) throws Exception;
	public List<Budget> listBudget(Map<String, Object> map) throws Exception;
	public int updateBudget(Budget dto)throws Exception;
}
