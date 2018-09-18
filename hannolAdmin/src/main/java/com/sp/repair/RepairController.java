package com.sp.repair;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("repair.repairContoller")
public class RepairController {
	
	@RequestMapping(value="/repair/list")
	public String list() throws Exception{
		
		return ".repair.list";
	}
}
