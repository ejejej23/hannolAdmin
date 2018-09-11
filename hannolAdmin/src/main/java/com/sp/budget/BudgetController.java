package com.sp.budget;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.staff.SessionInfo;

@Controller("budget.budgetController")
public class BudgetController {
	@Autowired
	private BudgetService service;
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/budget/list")
	public String list(@RequestParam(defaultValue = "1", value = "page") int page, Model model) throws Exception {
		model.addAttribute("page", page);
		return ".budget.list";
	}

	@RequestMapping(value = "/budget/sublist")
	public String sublist(@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req,
			Model model) throws Exception {
		String cp = req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		System.out.println(dataCount+"dataCount.............................................");
		System.out.println(current_page+".............................................");
		System.out.println(start+"////////////////////////////////////"+end);

		List<Budget> list = service.listBudget(map);
		
		int listNum,n=0;
		Iterator<Budget> it =list.iterator();
		while(it.hasNext()) {
			Budget data = it.next();
			listNum =dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
			
			System.out.println(data.getQuarter());
		}
		
		String query="";
		String listUrl=cp+"/budget/list";
		
		if(query.length()!=0) {
			listUrl=cp+"/budget/list?"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list",list);
		model.addAttribute("page",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "/budget/sub-list";
	}

	@ResponseBody
	@RequestMapping(value = "/budget/update")
	public Map<String, Object> updateMagam(@RequestParam(value = "page", defaultValue = "1") int page, Budget dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("staff");

		Map<String, Object> map = new HashMap<>();
		map.put("year", dto.getYear());
		map.put("quarter", dto.getQuarter());
		map.put("budget", dto.getBudget());

		dto.setUsersCode(info.getStaffIdx());

		service.updateBudget(dto);

		map.put("page", page);

		return map;
	}
}
