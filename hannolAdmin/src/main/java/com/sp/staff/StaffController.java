package com.sp.staff;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;

@Controller("staff.memberController")
public class StaffController {
	@Autowired
	private StaffService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/staff/list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<Staff> list = service.listStaff(map);

		int listNum, n = 0;
		Iterator<Staff> it = list.iterator();
		while (it.hasNext()) {
			Staff data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/staff/list";
		String articleUrl = cp + "/staff/staff?page=" + current_page;
		if (searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/staff/list?" + query;
			articleUrl = cp + "/staff/staff?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return ".staff.list";
	}

	@RequestMapping(value = "/staff/staff", method = RequestMethod.GET)
	public String staffForm(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, HttpServletRequest req,
			@RequestParam(value = "num") int num, Model model) throws Exception {
		searchValue = URLDecoder.decode(searchValue, "utf-8");

		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}

		Staff dto = service.readStaff(num);
		if (dto == null) {
			return "redirect:/staff/list?" + query;
		}

		dto.setTel1(dto.getTel().substring(0, 3));
		dto.setTel2(dto.getTel().substring(4, 8));
		dto.setTel3(dto.getTel().substring(9));

		// 재직중이면 퇴사일자 빈칸으로 하기
		if (dto.getInDate() != null && dto.getOutDate() != null) {
			boolean compare = dto.getInDate().compareTo(dto.getOutDate()) > 0;
			if (compare) {
				dto.setOutDate("");
			}
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("mode", "update");
		return ".staff.staff";
	}

	@ResponseBody
	@RequestMapping(value = "/staff/update", method = RequestMethod.POST)
	public Map<String, Object> updateSubmit(Staff dto) throws Exception {

		String tel = dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3();
		dto.setTel(tel);

		// 비밀번호 암호화
		String staffPwd = new BCryptPasswordEncoder().encode(dto.getStaffPwd());
		dto.setStaffPwd(staffPwd);

		service.updateStaff(dto);

		StringBuffer sb = new StringBuffer();
		sb.append(dto.getName() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mode", "updateInfo");
		map.put("message", sb.toString());
		map.put("usersCode", dto.getUsersCode());

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/staff/updateAuth")
	public Map<String, Object> updateAuth(@RequestParam(value = "usersCode") int usersCode,
			@RequestParam(value = "authority") String authority) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usersCode", usersCode);
		map.put("authority", authority);

		service.updateStaffAuth(map);

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/staff/updateInout")
	public Map<String, Object> updateInout(@RequestParam(value = "usersCode") int usersCode,
			@RequestParam(value = "gubun") int gubun, @RequestParam(value = "inoutDate") String inoutDate,
			@RequestParam(value = "memo") String memo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gubun", gubun);
		map.put("usersCode", usersCode);
		map.put("epDate", inoutDate);
		map.put("memo", memo);

		// working, 입퇴사 변경
		if (gubun == 1) {
			// 입사 : working>1, 입사기록 남기기
			map.put("working", 1);
			service.insertInoutStaff(map);
		} else {
			// 퇴사 : working>0, 퇴사기록 남기기
			map.put("working", 0);
			service.insertInoutStaff(map);
		}

		return map;
	}

	@RequestMapping(value = "/staff/myInfo", method = RequestMethod.GET)
	public String myInfoForm(HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("staff");
		int num = (int) info.getStaffIdx();

		Staff dto = service.readStaff(num);
		if (dto == null) {
			return "redirect:";
		}

		dto.setTel1(dto.getTel().substring(0, 3));
		dto.setTel2(dto.getTel().substring(4, 8));
		dto.setTel3(dto.getTel().substring(9));

		// 재직중이면 퇴사일자 빈칸으로 하기
		if (dto.getInDate() != null && dto.getOutDate() != null) {
			boolean compare = dto.getInDate().compareTo(dto.getOutDate()) > 0;
			if (compare) {
				dto.setOutDate("");
			}
		}

		model.addAttribute("dto", dto);

		model.addAttribute("mode", "update");
		return ".staff.myInfo";
	}

	@ResponseBody
	@RequestMapping(value = "/staff/updateMyinfo", method = RequestMethod.POST)
	public Map<String, Object> updateMyinfoSubmit(Staff dto) throws Exception {

		String tel = dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3();
		dto.setTel(tel);

		if (dto.getStaffPwd() != "") {
			// 비밀번호 암호화
			String staffPwd = new BCryptPasswordEncoder().encode(dto.getStaffPwd());
			dto.setStaffPwd(staffPwd);
			service.updatePwd(dto);
		}

		service.updateStaff(dto);

		StringBuffer sb = new StringBuffer();
		sb.append(dto.getName() + "님의 회원정보가 정상적으로 변경되었습니다.<br>");

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("mode", "updateInfo");
		map.put("message", sb.toString());
		map.put("usersCode", dto.getUsersCode());

		return map;
	}
}
