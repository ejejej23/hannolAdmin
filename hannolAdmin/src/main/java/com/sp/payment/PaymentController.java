package com.sp.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.common.MyUtil;

@Controller("payment.paymentController")
public class PaymentController {
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/payment/list")
	public String reservationList() {
		return ".payment.list";
	}
}
