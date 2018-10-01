package com.sp.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;
import com.sp.staff.Staff;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public Staff readStaff() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(Notice dto, String pathname) throws Exception {
		int result = 0;
		try {
			if (dto.getUpload() != null && !dto.getUpload().isEmpty()) {
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			dao.insertData("notice.insertNotice", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) throws Exception {
		List<Notice> list = null;
		try {
			list = dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Notice> listOnlyNotice(Map<String, Object> map) throws Exception {
		List<Notice> list = null;
		try {
			list = dao.selectList("notice.listOnlyNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Notice readNotice(int noticeCode) throws Exception {
		Notice dto = null;
		try {
			dto = dao.selectOne("notice.readNotice", noticeCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) throws Exception {
		Notice dto = null;
		try {
			dto = dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) throws Exception {
		Notice dto = null;
		try {
			dto = dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) throws Exception {
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
			
			dao.updateData("notice.updateNotice", dto);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteNotice(int num, long usersCode, String pathname) throws Exception {
		int result = 0;
		try {
			Notice dto = dao.selectOne("notice.readNotice", num);
			int amIAdmin = dao.selectOne("staff.amIAdmin", (int)usersCode);
			
			if (dto == null || (amIAdmin == 0 && usersCode != dto.getUsersCode()))
				return result;

			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			result = dao.deleteData("notice.deleteNotice", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
