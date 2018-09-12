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

	@RequestMapping(value = "/staff/staff", method = RequestMethod.POST)
	public String staffSubmit(Staff dto, Model model) {

		/*
		 * int result=service.insertMember(dto); if(result==1) { StringBuffer sb=new
		 * StringBuffer(); sb.append(dto.getUserName()+ "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		 * sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		 * 
		 * model.addAttribute("message", sb.toString()); model.addAttribute("title",
		 * "회원 가입");
		 * 
		 * return ".member.complete"; }
		 * 
		 * model.addAttribute("mode", "created"); model.addAttribute("message",
		 * "아이디 중복으로 회원가입이 실패했습니다.");
		 */

		return ".staff.staff";
	}

	@RequestMapping(value = "/staff/login", method = RequestMethod.GET)
	public String loginForm() {
		return ".staff.login";
	}

	@RequestMapping(value = "/staff/login", method = RequestMethod.POST)
	public String loginSubmit(@RequestParam String staffId, @RequestParam String staffPwd, HttpSession session,
			Model model)  throws Exception{

		Staff dto = service.loginStaff(staffId);
		if (dto == null || !staffPwd.equals(dto.getStaffPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".staff.login";
		}

		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setStaffIdx(dto.getUsersCode());
		info.setStaffId(dto.getStaffId());
		info.setStaffName(dto.getName());
		info.setAuthority(dto.getAuthority());

		session.setMaxInactiveInterval(30 * 60); // 세션유지시간 30분, 기본:30분

		session.setAttribute("staff", info);

		// 로그인 이전 URI로 이동
		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if (uri == null)
			uri = "redirect:/";
		else
			uri = "redirect:" + uri;

		return uri;
	}

	@RequestMapping(value = "/staff/logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("staff");

		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/staff/pwd", method = RequestMethod.GET)
	public String pwdForm(String dropout, Model model) {

		if (dropout == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}

		return ".staff.pwd";
	}

	@RequestMapping(value = "/staff/pwd", method = RequestMethod.POST)
	public String pwdSubmit(@RequestParam String staffPwd, @RequestParam String mode, Model model,
			HttpSession session) {
		/*
		 * SessionInfo info=(SessionInfo)session.getAttribute("member");
		 * 
		 * Member dto=service.readMember(info.getUserId()); if(dto==null) {
		 * session.invalidate(); return "redirect:/"; }
		 * 
		 * if(! dto.getUserPwd().equals(userPwd)) { if(mode.equals("update")) {
		 * model.addAttribute("mode", "update"); } else { model.addAttribute("mode",
		 * "dropout"); } model.addAttribute("message", "패스워드가 일치하지 않습니다."); return
		 * ".member.pwd"; }
		 * 
		 * if(mode.equals("dropout")){ // 게시판 테이블등 자료 삭제
		 * 
		 * // 회원탈퇴 처리
		 * 
		 * Map<String, Object> map = new HashMap<>(); map.put("memberIdx",
		 * info.getMemberIdx()); map.put("userId", info.getUserId());
		 * 
		 * 
		 * // 세션 정보 삭제 session.removeAttribute("member"); session.invalidate();
		 * 
		 * StringBuffer sb=new StringBuffer(); sb.append(dto.getUserName()+
		 * "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>"); sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
		 * 
		 * model.addAttribute("title", "회원 탈퇴"); model.addAttribute("message",
		 * sb.toString());
		 * 
		 * return ".member.complete"; }
		 * 
		 * // 회원정보수정폼 model.addAttribute("dto", dto); model.addAttribute("mode",
		 * "update");
		 */
		return ".staff.staff";
	}

	@RequestMapping(value = "/staff/update", method = RequestMethod.POST)
	public String updateSubmit(Staff dto, Model model) {

		/*
		 * service.updateMember(dto);
		 * 
		 * StringBuffer sb=new StringBuffer(); sb.append(dto.getUserName()+
		 * "님의 회원정보가 정상적으로 변경되었습니다.<br>"); sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
		 * 
		 * model.addAttribute("title", "회원 정보 수정"); model.addAttribute("message",
		 * sb.toString());
		 */
		return ".staff.complete";
	}

	@RequestMapping(value = "/staff/staffIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String staffId) throws Exception {

		String p = "true";
		Staff dto = service.loginStaff(staffId);
		if (dto != null)
			p = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		return model;
	}

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
		while(it.hasNext()) {
			Staff data = it.next();
			listNum = dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp+"/staff/list";
		String articleUrl = cp +"/staff/staff?page="+current_page;
		if(searchValue.length()!=0) {
			query = "searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue,"utf-8");
		}
		
		if(query.length()!=0) {
			listUrl =cp+"/staff/list?"+query;
			articleUrl = cp+"/staff/staff?page="+current_page+"&"+query;
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
			@RequestParam(value="num") int num,
			Model model)  throws Exception{
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
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		model.addAttribute("mode", "update");
		return ".staff.staff";
	}

}
