package com.sp.giftshop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("giftshop.giftShopService")
public class GiftShopServiceImpl implements GiftShopService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public List<String> gubunList() throws Exception {
		List<String> list = null;
		try {
			list = dao.selectList("gift.listGubun");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int insertGiftGoods(GiftShop dto, String pathname) throws Exception {
		int result = 0;
		try {
			int seq = dao.selectOne("gift.seq");
			dto.setGoodsCode(seq);

			result = dao.insertData("gift.insertGift", dto);
			dao.insertData("gift.insertGiftInfo", dto);
			dao.insertData("gift.insertGiftCount", dto);

			if (!dto.getUpload().isEmpty()) {
				for (MultipartFile mf : dto.getUpload()) {
					if (mf.isEmpty())
						continue;

					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if (saveFileName != null) {
						String orignalFileName = mf.getOriginalFilename();
						Map<String, Object> map = new HashMap<>();
						map.put("orignalFileName", orignalFileName);
						map.put("saveFileName", saveFileName);
						map.put("goodsCode", dto.getGoodsCode());
						insertFile(map);
					}
				}
			}
		} catch (Exception e) {
			throw e;
		}

		return result;
	}

	@Override
	public int insertFile(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.insertData("gift.insertFile", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	//List불러오기 version.1
	@Override
	public List<GiftShop> listGiftGoods(Map<String, Object> map) throws Exception {
		List<GiftShop> list = null;
		try {
			list = dao.selectList("gift.ListGift", map);
			
			for(GiftShop dto : list) {
				Map<String, Object> imgMap = null;
				imgMap = dao.selectOne("gift.readGoodsImg", dto.getGoodsCode());
				
				if(imgMap != null) {
					List<String> imgList = new ArrayList<>();
					imgList.add((String)imgMap.get("ORIGINALFILENAME"));
					dto.setOrignalFileName(imgList);
					
					imgList = new ArrayList<>();
					imgList.add((String)imgMap.get("SAVEFILENAME"));
					dto.setSaveFileName(imgList);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("gift.dataCount", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<GiftShop> aJaxListGiftGoods(Map<String, Object> map) throws Exception {
		
		List<GiftShop> list = null;
		try {
			list = dao.selectList("gift.ajaxListGift", map);
			
			for(GiftShop dto : list) {
				Map<String, Object> imgMap = null;
				imgMap = dao.selectOne("gift.readGoodsImg", dto.getGoodsCode());
				
				if(imgMap != null) {
					dto.setThumbnail((String)imgMap.get("SAVEFILENAME"));
				}
			}
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public GiftShop readGoods(int goodsCode) throws Exception {
		GiftShop dto = null;
		try {
			dto = dao.selectOne("gift.readGift", goodsCode);
			
			if(dto != null) {
				List<Map<String, Object>> imgMap = null;
				imgMap = dao.selectList("gift.ListGoodsImg", dto.getGoodsCode());
				
				if(imgMap != null) {
					dto.setFileList(imgMap);
					/*
					List<String> originalFileList = new ArrayList<>();
					List<String> saveFileList = new ArrayList<>();
					for(int i=0; i<imgMap.size(); i++) {
						String org = (String)imgMap.get(i).get("ORIGINALFILENAME");
						String save = (String)imgMap.get(i).get("SAVEFILENAME");
						originalFileList.add(org);
						saveFileList.add(save);
					}
					
					dto.setOrignalFileName(originalFileList);
					dto.setSaveFileName(saveFileList);
					*/
				}
				
			}
			
			
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}

	@Override
	public int deleteFiles(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("gift.DeleteFile", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public int updateGiftGoods(GiftShop dto, String pathname) throws Exception {
		int result = 0;
		try {
			dao.updateData("gift.updateGift", dto);
			dao.updateData("gift.updateGiftInfo", dto);
			
			if (!dto.getUpload().isEmpty()) {
				for (MultipartFile mf : dto.getUpload()) {
					if (mf.isEmpty())
						continue;

					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if (saveFileName != null) {
						String orignalFileName = mf.getOriginalFilename();
						Map<String, Object> map = new HashMap<>();
						map.put("orignalFileName", orignalFileName);
						map.put("saveFileName", saveFileName);
						map.put("goodsCode", dto.getGoodsCode());
						insertFile(map);
					}
				}
			}
			
			result=1;
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
