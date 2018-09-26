package com.sp.goodsIn;

import java.util.List;
import java.util.Map;

public interface GoodsInService {
	public int insertGoodsIn(GoodsIn dto);
	public int dataCount(Map<String, Object> map);
	public List<GoodsIn> listGoodsIn(Map<String, Object> map);
	public GoodsIn readGoodsIn(int num);
	public int updateGoodsIn(GoodsIn dto);
	
	public List<Map<String, Object>> listGubun();
	public List<Map<String, Object>> listItem(int num);
 	public List<Map<String, Object>> listCompany();
 	
 	public int goodsCount(int num);
 	public int searchMagam(Map<String, Object> map);
}
