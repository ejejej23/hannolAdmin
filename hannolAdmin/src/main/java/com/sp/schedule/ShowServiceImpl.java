package com.sp.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("schedule.showService")
public class ShowServiceImpl implements ShowService {

	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertShow(Show dto, String pathname) throws Exception {
		int result = 0; 
		try {
			MultipartFile mf = dto.getUpload();
			String saveFilename = fileManager.doFileUpload(mf, pathname);
			if(saveFilename != null) {
				String originalFilename = mf.getOriginalFilename();
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(originalFilename);
			}
			result = dao.insertData("show.insertShow", dto);
			
			// 공연시간 showTime insert
//			List<String> showTime = dto.getShowTime();
//			Map<String, Object> map = new HashMap<>();
//			map.put("showCode", dto.getShowCode());
//			for(String st : showTime) {
//				map.put("showTime", st);
//				insertShowTime(map);
//			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int insertShowTime(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			dao.insertData("show.insertShowTime", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		 
		return 0;
	}

	@Override
	public List<Show> listShow(Map<String, Object> map) throws Exception {
		 
		return null;
	}

	@Override
	public Show readShow(int showCode) throws Exception {
		 
		return null;
	}

	@Override
	public int updateShow(Show dto, String pathname) throws Exception {
		 
		return 0;
	}


}
