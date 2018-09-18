package com.sp.schedule;

import java.util.List;
import java.util.Map;

public interface ShowService {
	// 공연 구분
//	public Map<String, Object> listShowGubun() throws Exception;
	
	// 삭제 고민..
	
	// 공연
	public int insertShow(Show dto, String pathname) throws Exception;	// 공연 사진 저장 때문에 pathname 필요하다.
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Show> listShow(Map<String, Object> map) throws Exception;
	public Show readShow(int showCode) throws Exception;
	public int updateShow(Show dto, String pathname) throws Exception;
//	public int deleteShow()

	// 공연 시간
	public int insertShowTime(Map<String, Object> map) throws Exception;
	public List<String> listShowTime(int showInfoCode) throws Exception;

	// 공연 상세
	public List<ShowInfo> listShowInfo(int showCode) throws Exception;
	public List<ShowSchedule> listShowSchedule(int showInfoCode) throws Exception;
	public List<ShowStartTime> listShowStartTime(int schCode) throws Exception;
	
	// 공연 일정
	
	// 예약 가능 시설
	public List<Map<String, Object>> listAvailableFacility(Map<String, Object> map) throws Exception;
}
