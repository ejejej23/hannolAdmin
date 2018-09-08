package com.sp.notice;

import java.util.List;
import java.util.Map;

import com.sp.staff.Staff;

public interface NoticeService {
	public Staff readStaff();
	public int insertNotice(Notice dto, String pathname);
	public int dataCount(Map<String,Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
}
