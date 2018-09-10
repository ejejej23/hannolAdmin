package com.sp.noticeS;

import java.util.List;
import java.util.Map;

import com.sp.notice.Notice;
import com.sp.staff.Staff;

public interface NoticeService {
	public Staff readStaff();
	public int insertNotice(Notice dto);
	public int dataCount(Map<String,Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listOnlyNotice(Map<String, Object> map);
	public Notice readNotice(int noticeCode);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	public int updateNotice(Notice dto);
	public int deleteNotice(int noticeCode,long usersCode);
}
