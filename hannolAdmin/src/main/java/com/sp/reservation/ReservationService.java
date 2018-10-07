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
	
	// 무대공연 - 좌석
	public int readSeatCount(int showInfoCode) throws Exception;
	public List<Integer> listSeat(Map<String, Object> map) throws Exception;

	// 결제 취소
	public void readTicketCodeByPayCode(int payCode) throws Exception;
	public List<Integer> readShowBookCodeByTicketCode(int ticketCode) throws Exception;
	
	// 삭제
	public int deleteShowBookInfo(int showBookCode) throws Exception;
	public int deleteShowBook(int showBookCode) throws Exception;

}
