package com.sp.goodsOut;

import java.util.List;
import java.util.Map;


public interface GoodsOutService {
	public int insertGoodsOut(GoodsOut dto);
	public int dataCount(Map<String, Object> map);
	public List<GoodsOut> listGoodsOut(Map<String, Object> map);
	public GoodsOut readGoodsOut(int num);
	public int updateGoodsOut(GoodsOut dto);
	
	public List<Map<String, Object>> listGubun();
	public List<Map<String, Object>> listItem(int num);
 	public List<Map<String, Object>> listCompany();
 	
 	public int goodsCount(int num);
 	public int goodsPrice(int num);
 	public int searchMagam(Map<String, Object> map);
}
