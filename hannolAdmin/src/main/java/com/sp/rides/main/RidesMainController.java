package com.sp.rides.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("main.ridesMainController")
public class RidesMainController {
	@RequestMapping(value="/rides/main")
	public String ridesChartList(Model model) throws Exception{
		return ".ridesMain.main";
	}
}
