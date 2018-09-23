package com.sp.coupon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("coupon.couponController")
public class CouponController {
	@RequestMapping(value = "/coupon/list")
	public String couponList() throws Exception {
		return ".coupon.list";
	}
	
	@RequestMapping(value="/coupon/created", method=RequestMethod.GET)
	public String insertCoupon(Model model) throws Exception{
		
		model.addAttribute("mode", "created");
		return ".coupon.created";
	}
}
