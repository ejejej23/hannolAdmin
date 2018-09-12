package com.sp.giftshop;

import java.util.List;
import java.util.Map;

public interface GiftShopService {
	public List<String> gubunList() throws Exception;
	public int insertGiftGoods(GiftShop dto, String pathname) throws Exception;
	public int insertFile(Map<String, Object> map) throws Exception;
	public List<GiftShop> listGiftGoods(Map<String, Object> map) throws Exception;
	public List<GiftShop> aJaxListGiftGoods(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String,Object> map) throws Exception;
}
