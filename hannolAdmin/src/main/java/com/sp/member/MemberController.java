package com.sp.member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("memberlist.memberlistController")
public class MemberController {
	@Autowired
	MemberService service;
	
	@Autowired
	MyUtil util;
	
	@RequestMapping(value = "/member/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		int rows = 10;
		int start = (current_page-1)*rows+1;
		int end = current_page * rows;

		int dataCount = service.dataCount();
		
		int total_page = util.pageCount(rows, dataCount);
		if(current_page > total_page)
			current_page=total_page;
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		List<Member> list = service.list(map);
		int listNum, n = 0;
		Iterator<Member> it = list.iterator();
		while (it.hasNext()) {
			Member data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		for(Member m: list) {
			if(m.getEnabled() == 1)
				m.setIsMember("N");
			else
				m.setIsMember("Y");
		}
		
		String cp = req.getContextPath();
		String list_url = cp + "/member/list";
		String articleUrl = cp + "/member/detail?page="+current_page;
		String paging = util.paging(current_page, total_page, list_url);
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		return ".member.list";
	}
	
	@RequestMapping(value = "/member/detail")
	public String detail(
			@RequestParam(value="page", defaultValue="1") int current_page, 
			int num, 
			Model model) throws Exception {
		
		Member dto = service.readMember(num);
		if(dto.getEnabled() == 1)
			dto.setIsMember("N");
		else
			dto.setIsMember("Y");
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", current_page);
		return ".member.detail";
	}
}
