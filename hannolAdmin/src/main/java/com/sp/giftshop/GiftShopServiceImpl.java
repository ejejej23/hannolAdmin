package com.sp.giftshop;

import java.util.List;

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
	public List<String> gubunList() {
		List<String> list = null;
		try {
			list = dao.selectList("gift.listGubun");
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int insertGiftGoods(GiftShop dto, String pathname) {
		int result = 0;
		try {
			int seq = dao.selectOne("gift.seq");
			dto.setGoodsCode(seq);
			
			result = dao.insertData("gift.insertGift", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if(saveFileName != null) {
						String orignalFileName = mf.getOriginalFilename();
						dto.setOrignalFileName(orignalFileName);
						dto.setSaveFileName(saveFileName);
						
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public int insertFile(GiftShop dto) {
		int result = 0;
		try {
			result = dao.insertData("gift.insertFile", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
