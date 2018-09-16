package com.sp.schedule;

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
//			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
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
	public List<Show> listShow(Map<String, Object> map) throws Exception {
		List<Show> list = null;
		try {
			list = dao.selectList("show.listShow", map);
			
			for(Show s : list) {
				List<String> showTime = listShowTime(s.getShowInfoCode());
				s.setShowTime(showTime);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	
	@Override
	public List<String> listShowTime(Integer showInfoCode) throws Exception {
		List<String> list = null;
		try {
			list = dao.selectList("show.listShowTime", showInfoCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("show.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public Show readShow(int showCode) throws Exception {
		Show dto = null;
		try {
			dto = dao.selectOne("show.readShow", showCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateShow(Show dto, String pathname) throws Exception {
		int result = 0;
		
		try {
			// 업로드한 파일이 존재한 경우
			String newSaveFileName = fileManager.doFileUpload(dto.getUpload(), pathname);
			
			if(newSaveFileName != null) {
				// 이전 파일 지우기
				if(dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
				dto.setSaveFilename(newSaveFileName);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result = dao.updateData("show.updateShow", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}



}
