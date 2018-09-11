package com.sp.magam;

import java.util.List;
import java.util.Map;

public interface MagamService {
	public int dataCount(Map<String,Object> map) throws Exception;
	public List<Magam> listMagam(Map<String,Object> map) throws Exception;
	public Magam readMagam(Map<String,Object> map) throws Exception;
	public int updateMagam(Magam dto) throws Exception;
}
