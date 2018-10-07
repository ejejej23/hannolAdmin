package com.sp.reservation;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.schedule.Show;

@Service("service.ReservationServiceImpl")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	CommonDAO dao;
	
	// 무대 공연
	@Override
	public List<Show> listNowPlaying() throws Exception {
		List<Show> list = null;
		try {
			list = dao.selectList("reservation.listNowPlaying");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Map<String, String>> listScreenDate(int showInfoCode) throws Exception {
		List<Map<String, String>> list = null;
		try {
			list = dao.selectList("reservation.listScreenDate", showInfoCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Map<String, String>> listStartTime(int schCode) throws Exception {
		List<Map<String, String>> list = null;
		try {
			list = dao.selectList("reservation.listStartTime", schCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<ShowReservation> listReservationMember(int sStartCode) throws Exception {
		List<ShowReservation> list = null;
		try {
			list = dao.selectList("reservation.listReservationMember", sStartCode);
			for(ShowReservation sr : list) {
				List<String> seatNum = listReservationSeatNum(sr.getShowBookCode());
				sr.setSeatNum(seatNum);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<String> listReservationSeatNum(int showBookCode) throws Exception {
		List<String> list = null;
		try {
			list = dao.selectList("reservation.listReservationSeatNum", showBookCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int readSeatCount(int showInfoCode) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("reservation.readSeatCount", showInfoCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Integer> listSeat(Map<String, Object> map) throws Exception {
		List<Integer> list = null;
		try {
			list = dao.selectList("reservation.listSeat", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int deleteShowBookInfo(int showBookCode) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("reservation.deleteShowBookInfo", showBookCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteShowBook(int showBookCode) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("reservation.deleteShowBook", showBookCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public void readTicketCodeByPayCode(int payCode) throws Exception {
		List<Integer> ticketCodelist = null;
		try {
			ticketCodelist = dao.selectList("reservation.readTicketCodeByPayCode", payCode);
			for(Integer i : ticketCodelist) {
				List<Integer> showBookCodeList = readShowBookCodeByTicketCode(i);
				
				// 삭제
				for(Integer j : showBookCodeList) {
					deleteShowBookInfo(j);
					deleteShowBook(j);
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	@Override
	public List<Integer> readShowBookCodeByTicketCode(int ticketCode) throws Exception {
		List<Integer> list = null;
		try {
			list = dao.selectList("reservation.readShowBookCodeByTicketCode", ticketCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
