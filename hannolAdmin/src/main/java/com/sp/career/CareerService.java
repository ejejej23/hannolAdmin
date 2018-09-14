package com.sp.career;

import java.util.List;
import java.util.Map;

public interface CareerService {
	public int dataCount(Map<String,Object> map) throws Exception;
	public Career readCareer(Map<String, Object> map) throws Exception;
	public List<Career> listCareer(Map<String, Object> map) throws Exception;
	public int insertCareer(Career dto) throws Exception;
	public int updateCareer(Career dto) throws Exception;
	public int updateTheme(Map<String,Object> map) throws Exception;
	public int deleteCareer(int usersCode) throws Exception;
	public String selectThemeName(int themeCode) throws Exception;
}
