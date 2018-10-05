package com.sp.company;

import java.util.List;
import java.util.Map;

public interface CompanyService {
	public int insertCompany(Company dto) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Company> listCompany(Map<String, Object> map) throws Exception;
	public Company readCompany(int num) throws Exception;
	public int updateCompany(Company dto) throws Exception;
	public int deleteCompany(int num) throws Exception;
}
