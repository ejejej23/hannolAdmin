package com.sp.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	CommonDAO dao;
	
	@Autowired
	FileManager fileManager;
	
	@Override
	public Event readEvent(int eventCode)  throws Exception{
		Event dto = null;
		try {
			dto = dao.selectOne("event.readEvent", eventCode);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int insertEvent(Event dto, String pathname) throws Exception {
		int result = 0;
		try {
			if (dto.getUpload() != null && !dto.getUpload().isEmpty()) {
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			result = dao.insertData("event.insertEvent", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int dataCount() throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("event.dataCount");
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<Event> listEvent(Map<String, Object> map) throws Exception {
		List<Event> list = null;
		try {
			list = dao.selectList("event.listEvent", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int deleteEvent(int num, long usersCode, String pathname) throws Exception {
		int result = 0;
		try {
			Event dto = dao.selectOne("event.readEvent", num);
			int amIAdmin = dao.selectOne("staff.amIAdmin", (int)usersCode);
			
			if (dto == null || (amIAdmin == 0 && usersCode != dto.getUsersCode()))
				return result;

			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			result = dao.deleteData("event.deleteEvent", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateEvent(Event dto, String pathname) throws Exception {
		int result = 0;
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				if (newFilename != null) {
					dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
				}
			}
			
			dao.updateData("event.updateEvent", dto);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
