package com.sp.schedule;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("schedule.showController")
public class ShowController {

//	showGubun @ModelAttribute
//	public List<>

	@Autowired
	private ShowService service;
	
	@Autowired
	private MyUtil myUtil;

	
	// 공연 스케쥴
	@RequestMapping(value = "/show/list", method = RequestMethod.GET)
	public String scheduleList() {
		return ".show.list";
	}

	
	// 공연 등록
	@RequestMapping(value = "/show/created", method = RequestMethod.GET)
	public String createForm(Model model) {

		model.addAttribute("mode", "created");

		return ".show.created";
	}

	@RequestMapping(value = "/show/created", method = RequestMethod.POST)
	public String createSubmit(Show dto, HttpSession session) throws Exception {
		// 저장 경로
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "show";

		service.insertShow(dto, pathname);

		return "redirect:/show/manage";
	}
	
	
	// 공연 리스트
	@RequestMapping(value = "/show/manage", method = RequestMethod.GET)
	public String manageShow() {
		return ".show.manage";
	}
	
	@RequestMapping(value="/show/{tab}/list", method=RequestMethod.GET)
	public String showList(
			@PathVariable String tab,
			@RequestParam(value="searchKey", defaultValue="all") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception{
		
		
		
		return "show/showList";
	}
	

}