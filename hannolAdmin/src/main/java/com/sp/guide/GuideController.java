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

@Controller("guide.guideController")
public class GuideController {

	@Autowired
	private GuideService service;

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

	@RequestMapping(value = "/guide/info")
	public String readInfo(@RequestParam Integer schCode, Model model) throws Exception {
		Guide dto = service.readInfo(schCode);
		if (dto == null) {
			return "redirect:/guide/list";
		}

		String role = dto.getRole().substring(0, 2);
		String roleImg = "";

		switch (role) {
		case "미키":
			roleImg = "miki.png";
			break;
		case "미니":
			roleImg = "mini.png";
			break;
		case "구피":
			roleImg = "goofy.png";
			break;
		case "도날":// 도날드
			roleImg = "donald.png";
			break;
		case "데이":// 데이지
			roleImg = "daisy.png";
			break;
		default:
			roleImg = "noimage.png";
			break;
		}

		String query = "schCode=" + schCode;

		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("mode", "info");
		model.addAttribute("roleImg", roleImg);

		return ".guide.info";
	}

	@RequestMapping(value = "/guide/delete")
	public String delete(@RequestParam(value = "schCode") int schCode,
			@RequestParam(value = "usersCodeM") Integer usersCodeM) throws Exception {
		// 예약한 회원이 있는 경우 예약한 일정 코드를 0으로 바꿔주고 일정은 삭제
		boolean isBooked=false;
		if(usersCodeM != null) {
			isBooked = true;
		}
		service.deleteGuide(schCode, isBooked);

		return "redirect:/guide/list";
	}
}
