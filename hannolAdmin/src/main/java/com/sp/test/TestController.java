package com.sp.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("test.testController")
public class TestController {

	@RequestMapping("/layout/list")
	public String testList() throws Exception{
		return ".layout.list";
	}
	

	@RequestMapping("/layout/article")
	public String testArticle() throws Exception{
		return ".layout.article";
	}
	

	@RequestMapping("/layout/created")
	public String testCreated() throws Exception{
		return ".layout.created";
	}
}
