package com.sp.guide;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;

@Controller("guide.guideController")
public class GuideController {

	@Autowired
	private GuideService service;

	@Autowired
	private MyUtil myUtil;

	// 공연 스케쥴
	@RequestMapping(value = "/guide/list", method = RequestMethod.GET)
	public String scheduleList(Model model) throws Exception {
		// 가이드인 직원의 직원번호/이름 조회해와야함 : staffList란 이름으로 넘겨주기

		List<Guide> stafflist = service.staffList();
		model.addAttribute("staffList", stafflist);

		List<Guide> guideList = service.guideList();
		model.addAttribute("guideList", guideList);

		return ".guide.list";
	}

	@ResponseBody
	@RequestMapping(value = "/guide/insertGuide", method = RequestMethod.POST)
	public Map<String, Object> insertGuide(Guide dto) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		int tmp = Integer.parseInt(dto.getUsersCode() + "");
		dto.setName(service.getName(tmp));

		service.insertGuide(dto);

		return map;
	}
	
	@RequestMapping(value="/guide/info")
	public String readInfo(@RequestParam Integer schCode,Model model) throws Exception{
		Guide dto = service.readInfo(schCode);
		if(dto==null) {
			return "redirect:/guide/list";
		}
		
		String query="schCode="+schCode;
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("mode", "info");
		
		return ".guide.info";
	}
}
