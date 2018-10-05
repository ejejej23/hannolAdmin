package com.sp.grade;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("service.gradeService")
public class GradeServiceImpl implements GradeService {

	@Autowired
	CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public List<Grade> list() throws Exception {
		List<Grade> list = null;
		try {
			list = dao.selectList("grade.list");
		} catch (Exception e) {
		}

		return list;
	}

	@Override
	public int insertGrade(Grade dto, String pathname) throws Exception {
		int result = 0;
		try {
			if (dto.getUpload() != null && !dto.getUpload().isEmpty()) {
				String saveFileName = fileManager.doFileUpload(dto.getUpload(), pathname);

				dto.setSaveFileName(saveFileName);
				dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
			}
			result = dao.insertData("grade.insertGrade", dto);
		} catch (Exception e) {
		}

		return result;
	}

	@Override
	public Grade readGrade(int gradeCode) throws Exception {
		Grade dto = null;
		try {
			dto = dao.selectOne("grade.readGrade", gradeCode);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int deleteGrade(int gradeCode, String saveFileName, String pathname) throws Exception {
		int result = 0;
		try {
			if (saveFileName != null && result == 1) {
				fileManager.doFileDelete(saveFileName, pathname);
			}
			
			result = dao.deleteData("grade.deleteGrade", gradeCode);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateGrade(Grade dto, String pathname) throws Exception {
		int result = 0;

		try {
			if (dto.getUpload() != null && !dto.getUpload().isEmpty()) {
				if (dto.getSaveFileName() != null && dto.getSaveFileName().length() != 0)
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);

				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				if (newFilename != null) {
					dto.setOriginalFileName(dto.getUpload().getOriginalFilename());
					dto.setSaveFileName(newFilename);
				}
			}
			result=dao.updateData("grade.updateGrade", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateMemberGrade(int gradeCode) throws Exception {
		int result = 0;
		try {
			int first = dao.selectOne("grade.getFirstCode");
			
			Map<String, Object> map = new HashMap<>();
			map.put("gradeCode", gradeCode);
			map.put("first", first);
			result = dao.updateData("grade.updateMemberGrade", map);
		} catch (Exception e) {
		}
		
		return result;
	}

}
