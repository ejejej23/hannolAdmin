package com.sp.grade;

import java.util.List;

public interface GradeService {
	public List<Grade> list() throws Exception;
	public int insertGrade(Grade dto, String pathname) throws Exception;
	public Grade readGrade(int gradeCode) throws Exception;
	public int deleteGrade(int gradeCode, String saveFileName, String pathname)throws Exception;
	public int updateGrade(Grade dto, String pathname) throws Exception;
	public int updateMemberGrade(int gradeCode) throws Exception;
}
