package com.sp.company;

import java.util.List;
import java.util.Map;

public interface CompanyService {
	public int insertCompany(Company dto);
	public int dataCount(Map<String, Object> map);
	public List<Company> listCompany(Map<String, Object> map);
}
