package com.sp.schedule;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.DateUtil;
import com.sp.common.MyUtil;

@Controller("schedule.showController")
public class ShowController {

	@Autowired
	private ShowService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private DateUtil dateUtil;
	
	// 공연 스케쥴
	@RequestMapping(value = "/show/list", method = RequestMethod.GET)
	public String scheduleList() {
		return ".show.list";
	}

	
	// 공연 등록
	@RequestMapping(value = "/show/created", method = RequestMethod.GET)
	public String createShowForm(Model model) {

		model.addAttribute("mode", "created");

		return ".show.created";
	}

	// 공연 등록 완료
	@RequestMapping(value = "/show/created", method = RequestMethod.POST)
	public String createShowSubmit(Show dto, HttpSession session) throws Exception {
		// 저장 경로
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "show";

		service.insertShow(dto, pathname);

		return "redirect:/show/manage";
	}
	
	
	// 공연 리스트
	@RequestMapping(value = "/show/manage", method = RequestMethod.GET)
	public String manageShow(
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="pageNo", defaultValue="1") int page,
			Model model) {
		
		// model - tab
		model.addAttribute("tab", tab);
		model.addAttribute("pageNo", page);
		
		return ".show.manage";
	}
	
	// 공연 리스트 - tab list
	@RequestMapping(value="/show/{gubunCode}/list", method=RequestMethod.GET)
	public String showList(
			@PathVariable String gubunCode,
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="searchKey", defaultValue="all") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception{
		// tab : all, experience(1), parade(2), stage(3)
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("get")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		if(!gubunCode.equals("0")) {
			map.put("gubunCode", gubunCode); ///////////////////////////////////////////// 
		}
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) 
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Show> list = service.listShow(map);
		
		String cp = req.getContextPath();
		String paging = myUtil.paging(current_page, total_page);
		String articleUrl = cp + "/show/article";
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("tab", tab);
		
		return "show/showList";
	}
	
	
	// 공연 정보 
	@RequestMapping(value="/show/article", method = RequestMethod.GET)
	public String article(
			@RequestParam(required=true) int showCode,
			@RequestParam(required=true, defaultValue="all") String tab,
			@RequestParam(value="pageNo", defaultValue="1") String page,
			Model model) throws Exception {
		
		Show dto = service.readShow(showCode);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", page);
		model.addAttribute("tab", tab);

		return ".show.article";
	}
	
	// 공연 수정 폼
	@RequestMapping(value="/show/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(required=true) int showCode,
			@RequestParam(required=true, defaultValue="all") String tab,
			@RequestParam(value="pageNo", defaultValue="1") String page,
			Model model) throws Exception {
		
		Show dto = service.readShow(showCode);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("tab", tab);
		model.addAttribute("pageNo", page);
		
		return ".show.created";
	}
	
	// 공연 수정
	@RequestMapping(value="/show/update", method=RequestMethod.POST)
	public String updateSubmit(
			@RequestParam(required=true, defaultValue="all") String tab,
			@RequestParam(value="pageNo") String page,
			HttpSession session,
			Show dto) throws Exception {
		// 저장 경로
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "show";
		
		service.updateShow(dto, pathname);
		
		return "redirect:/show/manage?tab="+tab+"&pageNo="+page;
	}
	
	// 공연 상세 정보
	@RequestMapping(value="/show/showDetail")
	public String detailArticle(
			@RequestParam(value="showCode") int showCode,
			Model model) throws Exception {
		// 공연에 대한 공연상세 리스트
			// ㄴ 공연상세에 대한 공연일정 리스트
				// ㄴ 공연일정에 대한 공연시작시간 리스트
		List<ShowInfo> list = service.listShowInfo(showCode);
		model.addAttribute("list", list);
		model.addAttribute("showCode", showCode);	// list가 없을 경우 showCode 를 못구하므로 넘긴다.
		
		return "show/showDetail";
	}

	// 공연 상세정보 추가
	@RequestMapping(value="/show/insertShowDetail")
	public String createShowInfoForm(
			@RequestParam(value="showCode") int showCode,
			Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		model.addAttribute("showCode", showCode);
		
		return "show/createdShowInfo";
	}
	
	@RequestMapping(value="/show/facilityList")
	public String facilityList(
			@RequestParam(value="startDate") String startDate,
			@RequestParam(value="endDate") String endDate,
			Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		// 서비스에서 받아서 오기
		List<Map<String, Object>> list = service.listAvailableFacility(map);
		model.addAttribute("list", list);
		
		return "show/facilityList";
	}
	
	@RequestMapping(value="/show/showInfo/created", method=RequestMethod.POST)
	public String createShowInfoSubmit(ShowInfo dto) throws Exception {
		
		// 상세 정보 insert 
		service.insertShowInfo(dto);
		
		// article redirect
		return "redirect:/show/article?showCode="+dto.getShowCode();
	}
	
	@RequestMapping(value="/show/updateShowDetail")
	public String updateShowInfoForm(@RequestParam(value="showInfoCode") int showInfoCode,
			Model model) throws Exception {
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
		
		
		
		return "show/createdShowInfo";
	}
	
}