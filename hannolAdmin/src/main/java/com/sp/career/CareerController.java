package com.sp.career;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.staff.Staff;
import com.sp.staff.StaffService;

@Controller("career.careerController")
public class CareerController {
	@Autowired
	private CareerService service;
	@Autowired
	private StaffService temp;
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/career/list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "usersCode", defaultValue = "0") int usersCode,
			Model model) throws Exception {
		
		model.addAttribute("page", page);
		model.addAttribute("usersCode", usersCode);
		
		return ".career.list";
	}

	@RequestMapping(value = "/career/getlist")
	public String sublist(@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req,
			@RequestParam(value = "usersCode", defaultValue = "0") int usersCode, Model model) throws Exception {
		String cp = req.getContextPath();

		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersCode", usersCode);

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page)
			current_page = total_page;

		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		
		String isStaff="true";
		Staff isExist = temp.readStaff(usersCode);
		if(isExist==null) {
			isStaff="false";
		}
		model.addAttribute("isStaff",isStaff);

		// 글 리스트
		List<Career> list = service.listCareer(map);

		// 리스트의 번호
		int listNum, n = 0;
		Iterator<Career> it = list.iterator();
		while (it.hasNext()) {
			Career data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/career/list";

		if (query.length() != 0) {
			listUrl = cp + "/career/list?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		//테마리스트값 가져가기
		List<Career> themeList = service.themeList();

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("themeList", themeList);

		return "/career/sub-list";
	}

	@ResponseBody
	@RequestMapping(value = "/career/update")
	public Map<String, Object> update(@RequestParam(value = "usersCode") int usersCode) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersCode", usersCode);

		return map;
	}

	@RequestMapping(value = "/career/info", method = RequestMethod.GET)
	public String infoForm(@RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest req,
			@RequestParam(value = "usersCode", defaultValue = "0") int usersCode,
			@RequestParam(value = "careerCode", defaultValue = "0") int careerCode, Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersCode", usersCode);
		map.put("careerCode", careerCode);

		String query = "page=" + page + "&usersCode=" + usersCode;

		Career dto = service.readCareer(map);

		if (dto == null) {
			return "redirect:/career/list?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("usersCode", usersCode);

		model.addAttribute("mode", "info");
		return ".career.info";
	}

	@RequestMapping(value = "/career/create", method = RequestMethod.GET)
	public String createForm(@RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest req,
			@RequestParam(value = "usersCode", defaultValue = "0") int usersCode, Model model) throws Exception {

		//부서, 직위리스트값 가져가기
		List<Career> dpList = service.dpList();
		List<Career> positionList = service.positionList();
		
		Staff isExist = temp.readStaff(usersCode);
		if(isExist==null) {
			return "redirect:/career/list?usersCode="+usersCode;
		}
		
		String query = "page=" + page + "&usersCode=" + usersCode;

		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("usersCode", usersCode);
		model.addAttribute("dpList", dpList);
		model.addAttribute("positionList", positionList);

		model.addAttribute("mode", "create");
		return ".career.info";
	}

	@RequestMapping(value = "/career/create", method = RequestMethod.POST)
	public String createdSubmit(Career dto) throws Exception {
		
		//코드들이 0이면 null처리해주기
		Integer temp = null;
		if(dto.getDpCode()==0) {
			dto.setDpCode(temp);
		}
		if(dto.getPositionCode()==0) {
			dto.setPositionCode(temp);
		}

		service.insertCareer(dto);
		long usersCode = dto.getUsersCode();

		return "redirect:/career/list?usersCode="+usersCode;
	}
	
	@RequestMapping(value = "/career/delete")
	public String delete(@RequestParam int careerCode,
			@RequestParam String page,
			@RequestParam int usersCode,
			HttpSession session) throws Exception {

		service.deleteCareer(careerCode);
		
		return "redirect:/career/list?usersCode="+usersCode;
	}
	
	@ResponseBody
	@RequestMapping(value = "/career/themeUpdate")
	public Map<String, Object> updateTheme(@RequestParam(value = "usersCode") int usersCode,
			int themeCode
			) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersCode", usersCode);
		map.put("themeCode", themeCode);
		
		service.updateTheme(map);
		
		String themeName = service.selectThemeName(themeCode);
		map.put("themeName", themeName);
		
		return map;
	}
}
