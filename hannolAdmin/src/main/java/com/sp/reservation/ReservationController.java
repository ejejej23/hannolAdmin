package com.sp.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.common.MyUtil;

@Controller("reservation.reservationController")
public class ReservationController {
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/reservation/list")
	public String reservationList() {
		return ".reservation.list";
	}
}
