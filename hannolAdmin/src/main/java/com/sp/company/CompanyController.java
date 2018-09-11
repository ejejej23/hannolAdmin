package com.sp.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.common.MyUtil;

@Controller("company.companyController")
public class CompanyController {
	@Autowired
	private CompanyService service;
	
	@Autowired
	private MyUtil util;
	
	
	
	@RequestMapping(value="/company/list", method=RequestMethod.GET)
	public String list() {
		
		return ".company.list";
	}
	
	/*@RequestMapping(value="/company/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		System.out.println("왓따!");
		
		
		return ".company.created";
	}*/
	
	@RequestMapping(value="/company/created", method=RequestMethod.POST)
	public String createdSubmit(Company dto, Model model) throws Exception{
		
		System.out.println("왔다2");
		
		String tel = dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3();
		System.out.println(tel);
		dto.setTel(tel);
		service.insertCompany(dto);
		
		
		return "redirect:/company/list";
	}
	
	
}
