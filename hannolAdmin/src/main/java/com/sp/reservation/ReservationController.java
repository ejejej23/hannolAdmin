package com.sp.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("reservation.reservationController")
public class ReservationController {
	@Autowired
	private MyUtil util;
	
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
			Model model) {
		
		return "/reservation/showBookList";
	}
	
	
}
