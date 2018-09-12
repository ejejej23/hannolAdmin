package com.sp.card; 

import java.io.File;
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
		int result = 0;
		try {
			result = dao.selectOne("card.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Card> listCard(Map<String, Object> map) throws Exception {
		List<Card> list = null;
		try {
			list = dao.selectList("card.listCard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Card readCard(int cardCode) throws Exception {
		Card dto =null;
		try {
			dto = dao.selectOne("card.readCard", cardCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateCard(Card dto, String pathname) throws Exception {
		int result=0;

		try{
			if(dto.getCardupload()!=null && !dto.getCardupload().isEmpty()) {
				if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				
				String newFilename = fileManager.doFileUpload(dto.getCardupload(), pathname);
				if (newFilename != null) {
					dto.setOriginalFilename(dto.getCardupload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
				}
			}
			if(dto.getLogoupload()!=null && !dto.getLogoupload().isEmpty()) {
				if(dto.getLogoSaveFilename()!=null &&dto.getLogoSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getLogoSaveFilename(), pathname);
				
				String newFilename = fileManager.doFileUpload(dto.getLogoupload(), pathname);
				if (newFilename != null) {
					dto.setLogoOriginalFilename(dto.getLogoupload().getOriginalFilename());
					dto.setLogoSaveFilename(newFilename);
				}
			}
			
			dao.updateData("card.updateCard", dto);
			result=1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteCard(int cardCode, String saveFilename, String saveLogoFilename, String pathname) {
		int result=0;

		try{
			if(saveFilename != null ) {
				fileManager.doFileDelete(saveFilename, pathname);
			}
			if(saveLogoFilename != null ) {
				fileManager.doFileDelete(saveLogoFilename, pathname);
			}
			
			dao.deleteData("card.deleteCard", cardCode);
			result=1;
		} catch(Exception e) {
		}
		return result;
	}

}
