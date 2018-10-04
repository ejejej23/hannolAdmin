package com.sp.rides.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("main.ridesMainController")
public class RidesMainController {
	
	@Autowired
	private RidesMainService service;
	
	@RequestMapping(value="/rides/main")
	public String ridesChartList(Model model) throws Exception{
		List<RidesMain> thema =  service.themaGubun();
		
		model.addAttribute("thema", thema);
		return ".ridesMain.main";
	}
	
	@RequestMapping(value="/rides/getYear")
	@ResponseBody
	public Map<String, Object> ridesGetYears(int themaCode) throws Exception{
		
		List<RidesMain> yearList = service.yearsList(themaCode);
		Map<String, Object> model = new HashMap<>();
		model.put("yearList", yearList);
		return model;
	}
}
