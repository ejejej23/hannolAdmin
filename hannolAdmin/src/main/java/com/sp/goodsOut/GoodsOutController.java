package com.sp.goodsOut;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.common.MyUtil;

@Controller("goodsOut.goodsOutController")
public class GoodsOutController {
	@Autowired
	GoodsOutService service;
	
	@Autowired
	MyUtil util;
	
	
	@RequestMapping(value="/goodsOut/list")
	public String list() throws Exception{
		
		return ".goodsOut.list";
	}
}
