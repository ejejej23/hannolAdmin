package com.sp.career;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("career.careerController")
public class CareerController {

	@RequestMapping(value="/career/list")
	public String list()throws Exception{
		return ".career.list";
	}
}
