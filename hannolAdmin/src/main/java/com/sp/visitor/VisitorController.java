package com.sp.visitor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("visitor.visitorController")
public class VisitorController {
	
	@RequestMapping(value = "/visitor/main")
	public String main() {
		
		return ".visitor.main";
	}
}
