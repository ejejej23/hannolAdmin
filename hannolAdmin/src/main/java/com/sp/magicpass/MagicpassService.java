package com.sp.magicpass;

import java.util.List;
import java.util.Map;

public interface MagicpassService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Magicpass> magicpassList(Map<String, Object> map) throws Exception;
	public int deleteReserve(Magicpass dto) throws Exception;
}
