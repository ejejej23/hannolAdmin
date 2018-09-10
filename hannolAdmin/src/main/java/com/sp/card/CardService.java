package com.sp.card;

import java.util.List;
import java.util.Map;

public interface CardService {
	public int insertCard(Card dto) throws Exception;
	public int dataCount(Map<String,Object> map) throws Exception;
	public List<Card> listCard(Map<String, Object> map) throws Exception;
	public Card readCard(int cardCode) throws Exception;
}
