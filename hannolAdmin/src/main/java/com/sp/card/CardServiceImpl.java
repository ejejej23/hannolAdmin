package com.sp.card;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("card.cardService")
public class CardServiceImpl implements CardService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertCard(Card dto, String pathname) throws Exception {
		int result = 0;
		try {
			if (dto.getCardupload() != null && !dto.getCardupload().isEmpty()) {
				String saveFilename = fileManager.doFileUpload(dto.getCardupload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getCardupload().getOriginalFilename());
			}
			if (dto.getLogoupload() != null && !dto.getLogoupload().isEmpty()) {
				String saveFilename = fileManager.doFileUpload(dto.getLogoupload(), pathname);
				dto.setLogoSaveFilename(saveFilename);
				dto.setLogoOriginalFilename(dto.getLogoupload().getOriginalFilename());
			}
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
