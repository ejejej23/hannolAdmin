package com.sp.rank;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("rank.rankController")
public class RankController {

	@RequestMapping(value = "/rank/list")
	public String list() {
		
		return ".rank.list";
	}
}
