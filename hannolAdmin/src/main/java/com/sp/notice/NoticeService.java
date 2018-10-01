package com.sp.notice;

import java.util.List;
import java.util.Map;

import com.sp.staff.Staff;

public interface NoticeService {
	public Staff readStaff() throws Exception;
	public int insertNotice(Notice dto, String pathname) throws Exception;
	public int dataCount(Map<String,Object> map) throws Exception;
	public List<Notice> listNotice(Map<String, Object> map) throws Exception;
	public List<Notice> listOnlyNotice(Map<String, Object> map) throws Exception;
	public Notice readNotice(int noticeCode) throws Exception;
	public Notice preReadNotice(Map<String, Object> map) throws Exception;
	public Notice nextReadNotice(Map<String, Object> map) throws Exception;
	public int updateNotice(Notice dto, String pathname) throws Exception;
	public int deleteNotice(int noticeCode,long usersCode, String pathname) throws Exception;
}
