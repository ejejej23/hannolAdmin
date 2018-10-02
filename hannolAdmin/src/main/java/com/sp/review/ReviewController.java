package com.sp.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("review.ReviewController")
public class ReviewController {

	@RequestMapping(value="/review/list")
	public String reservationList() {
		return ".review.list";
	}
}
