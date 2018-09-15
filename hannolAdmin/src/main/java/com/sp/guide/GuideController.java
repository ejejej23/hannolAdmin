package com.sp.guide;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.common.MyUtil;

@Controller("guide.guideController")
public class GuideController {
	
	@Autowired
	private MyUtil myUtil;
	
	// 공연 스케쥴
	@RequestMapping(value = "/guide/list", method = RequestMethod.GET)
	public String scheduleList() {
		return ".guide.list";
	}

}
