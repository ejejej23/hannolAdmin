package com.sp.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("event.eventController")
public class EventController {

	@RequestMapping(value = "/event/list")
	public String list() throws Exception {

		return ".event.list";
	}
}
