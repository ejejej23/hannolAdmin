package com.sp.giftshop;

import java.util.List;

public interface GiftShopService {
	public List<String> gubunList();
	public int insertGiftGoods(GiftShop dto, String pathname);
	public int insertFile(GiftShop dto);
}
