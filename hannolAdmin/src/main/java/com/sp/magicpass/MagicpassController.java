package com.sp.magicpass;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;

@Controller("magicpass.magicpassController")
public class MagicpassController {

	@Autowired
	private MyUtil util;
	
	@Autowired
	private MagicpassService service;
	
	@RequestMapping(value="/magicpass/list")
	public String reservationList(
			@RequestParam(value="tab", defaultValue="all") String tab, 
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="attrctn") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) {
		
		model.addAttribute("tab", tab);
		model.addAttribute("page", page);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return ".magicpass.list";
	}
	
	@RequestMapping(value="/magicpass/ajaxList")
	public String reservationAjaxList(
			@RequestParam(value="tab", defaultValue="all") String tab, 
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="attrctn") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("tab", tab);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = util.pageCount(rows, dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Magicpass> list = service.magicpassList(map);
		String query = "";
		if(searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		String paging = util.paging(current_page, total_page);
		
		String timeStamp = new SimpleDateFormat("HH").format(new Date());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		Date now = dateFormat.parse(today);
		for(Magicpass dto : list) {
			Date reservDate = dateFormat.parse(dto.getMpDate());
			int compare = now.compareTo(reservDate);
			
			if(compare>0) {
				dto.setState(1);
			}else if(compare==0 && dto.getMpTime()>Integer.parseInt(timeStamp)) {
				dto.setState(0);
			}else {
				dto.setState(1);
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		
		return "/magicpass/list-body";
	}
	
	@RequestMapping(value="/magicpass/deleteReserve")
	@ResponseBody
	public Map<String, Object> deleteReserve(Magicpass dto) throws Exception{
		String state = "fail";
		
		Map<String, Object> model = new HashMap<>();
		int result = service.deleteReserve(dto);
		if(result != 0) {
			state = "success";
		}
		model.put("state", state);
		return model;
	}
}
