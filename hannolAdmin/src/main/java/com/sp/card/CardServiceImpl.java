package com.sp.card;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("card.cardService")
public class CardServiceImpl implements CardService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertCard(Card dto) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("card.insertCard", dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Card> listCard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Card readCard(int cardCode) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
