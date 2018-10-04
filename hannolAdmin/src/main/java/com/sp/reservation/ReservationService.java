package com.sp.reservation;

import java.util.List;
import java.util.Map;

import com.sp.schedule.Show;

public interface ReservationService {
	// 무대공연
	public List<Show> listNowPlaying() throws Exception;								// 현재 상영중인 공연의 목록(공연장이 있는 공연)
	public List<Map<String, String>> listScreenDate(int showInfoCode) throws Exception; // schCode, screenDate list
	public List<Map<String, String>> listStartTime(int schCode) throws Exception; 		// sStartCode, startTime list
	public List<ShowReservation> listReservationMember(int sStartCode) throws Exception;
	public List<String> listReservationSeatNum(int showBookCode) throws Exception;
	
}
