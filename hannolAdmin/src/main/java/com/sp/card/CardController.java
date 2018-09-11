package com.sp.card; 
 
import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
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

import com.sp.common.MyUtil;

@Controller("card.cardController")
public class CardController {

	@Autowired
	CardService service;

	@Autowired
	MyUtil util;

	@RequestMapping(value = "/card/list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "all") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue, HttpServletRequest req,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 5;
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
			total_page = util.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<Card> list = service.listCard(map);

		String query = "page="+current_page;
		String listUrl = cp + "/card/list";
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/card/list?" + query;
		}

		String paging = util.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);

		return ".card.card";
	}

	@RequestMapping(value = "/card/created", method = RequestMethod.GET)
	public String createdForm(Card card, Model model) throws Exception {
		model.addAttribute("mode", "created");

		return ".card.created";
	}

	@RequestMapping(value = "/card/created", method = RequestMethod.POST)
	public String createdSubmit(Card dto, HttpSession session, Model model) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "card";

		int result = service.insertCard(dto, pathname);
		if (result != 1) {
			return "redirect:/card/created";
		}

		return "redirect:/card/list";
	}

	@RequestMapping(value = "/card/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(value = "searchKey", defaultValue = "all") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model) throws Exception {
		
		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		Card dto = service.readCard(num);
		if(dto==null) {
			return "redirect:/card/list?"+query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return ".card.created";
	}
	
	@RequestMapping(value="/card/update", method=RequestMethod.POST)
	public String updateSubmit(
			Card dto,
			@RequestParam String saveFilename,
			@RequestParam String originalFilename,
			@RequestParam String logoSaveFilename,
			@RequestParam String logoOriginalFilename,
			@RequestParam String page,
			@RequestParam(value = "searchKey", defaultValue = "all") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			HttpSession session) throws Exception {

		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "card";		
		
		dto.setSaveFilename(saveFilename);
		dto.setOriginalFilename(originalFilename);
		dto.setLogoSaveFilename(logoSaveFilename);
		dto.setLogoOriginalFilename(logoOriginalFilename);
		
		service.updateCard(dto, pathname);		
		
		
		return "redirect:/card/list?"+query;
	}
	
	@RequestMapping(value="/card/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(value = "searchKey", defaultValue = "all") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		Card dto = service.readCard(num);
		if(dto==null) {
			return "redirect:/card/list?page="+page;
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "card";		
 	
		service.deleteCard(num, dto.getSaveFilename(), dto.getLogoSaveFilename(), pathname);
		
		return "redirect:/card/list?"+query;
	}
}
