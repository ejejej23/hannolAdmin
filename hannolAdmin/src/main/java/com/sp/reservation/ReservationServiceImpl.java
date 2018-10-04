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

}
