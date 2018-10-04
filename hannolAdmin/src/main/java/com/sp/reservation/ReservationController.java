package com.sp.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.schedule.Show;

@Controller("reservation.reservationController")
public class ReservationController {
	@Autowired
	private MyUtil util;
	
	@Autowired
	private ReservationService service;
	
	@RequestMapping(value="/reservation/list")
	public String reservationList(Model model) {
		model.addAttribute("tab", "show");
		model.addAttribute("pageNo", "1");
		return ".reservation.list";
	}

	// 공연
	@RequestMapping(value="/reservation/show/list")
	public String reservationShowList(
			@RequestParam(value="pageNo", defaultValue="1") int page,
			Model model) throws Exception {
		
		List<Show> list = service.listNowPlaying();
		model.addAttribute("showList", list);
		
		return "/reservation/showBookList";
	}
	
	// 공연 - selectBox
	@RequestMapping(value="/reservation/show/screenDate")
	@ResponseBody
	public Map<String, Object> reservationScreenDateList(
			@RequestParam(value="showInfoCode") int showInfoCode
			) throws Exception {
 		Map<String, Object> model=new HashMap<>();
		
		List<Map<String, String>> list = service.listScreenDate(showInfoCode);
		if(list.size() == 0) {
			model.put("state", "false");
			model.put("msg", "해당 공연의 상영 일정이 없습니다. 다른 공연을 선택하세요");
			return model;
		} 
		model.put("list", list);
		model.put("state", "screenDatetrue");
		return model;
	}
	
	// 공연 - selectBox
	@RequestMapping(value="/reservation/show/startTime")
	@ResponseBody
	public Map<String, Object> reservationStartTimeList(
			@RequestParam(value="schCode") int schCode
			) throws Exception {
		Map<String, Object> model=new HashMap<>();
		
		List<Map<String, String>> list = service.listStartTime(schCode);
		if(list.size() == 0) {
			model.put("state", "false");
			model.put("msg", "해당 일정의 상영 시간이 없습니다. 다른 일자를 선택하세요");
			return model;
		} 

		model.put("list", list);
		model.put("state", "startTimetrue");
		return model;
	}
	
	// 공연 - 예약자 조회
	@RequestMapping(value="/reservation/reservationList")
	public String reservationList(
			@RequestParam(value="showInfoCode") int showInfoCode,
			@RequestParam(value="sStartCode") int sStartCode,
			@RequestParam(value="screenDate") String screenDate,
			@RequestParam(value="startTime") String startTime,
			Model model) throws Exception {
		
		// 시설의 총 좌석 수
		int seatCount = service.readSeatCount(showInfoCode);
		
		// 예약된 좌석 리스트
		Map<String, Object> map = new HashMap<>();
		map.put("screenDate", screenDate);
		map.put("showInfoCode", showInfoCode);
		map.put("startTime", startTime);
		List<Integer> seatList = service.listSeat(map);
		
		model.addAttribute("seatCount", seatCount);
		model.addAttribute("screenDate", screenDate);
		model.addAttribute("startTime", startTime);
		model.addAttribute("showInfoCode", showInfoCode);
		model.addAttribute("seatList", seatList);
		
		// 예약자
		List<ShowReservation> list = service.listReservationMember(sStartCode);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", list.size());
		
		return "/reservation/reservationLIst";
	}
	
	
}
