package com.sp.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("company.companyController")
public class CompanyController {
	
	@RequestMapping(value="/company/companyList", method=RequestMethod.GET)
	public String list() {
	
		return ".company.companyList";
	}
}
