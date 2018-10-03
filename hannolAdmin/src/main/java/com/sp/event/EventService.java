package com.sp.event;

import java.util.List;
import java.util.Map;


public interface EventService {
	public Event readEvent(int eventCode) throws Exception;
	public int dataCount() throws Exception;
	public int insertEvent(Event dto, String pathname) throws Exception;
	public List<Event> listEvent(Map<String, Object> map) throws Exception;
	public int updateEvent(Event dto, String pathname) throws Exception;
	public int deleteEvent(int noticeCode,long usersCode, String pathname) throws Exception;

}
