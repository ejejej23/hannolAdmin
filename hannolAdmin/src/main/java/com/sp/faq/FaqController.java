package com.sp.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.common.MyUtil;

@Controller("faq.faqController")
public class FaqController {
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/faq/list")
	public String faqList() throws Exception{
		return ".faq.list";
	}
}
