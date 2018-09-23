package com.sp.ticket;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("ticket.ticketController")
public class TicketController {
	
	@Autowired
	private TicketService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/ticket/list")
	public String ticketList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="goodsName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
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
		
		List<Ticket> list = service.listTicket(map);
		
		String query = "";
		String articleUrl = cp+"/ticket/article?page="+current_page;
		String listUrl = cp + "/ticket/list";
		if(searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length() != 0) {
			articleUrl+="&"+query;
			listUrl+="?"+query;
		}
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		
		return ".ticket.list";
	}
	
	@RequestMapping(value="/ticket/created", method=RequestMethod.GET)
	public String ticketCreatedForm(Model model) throws Exception{
		
		List<String> gubunList = service.gubunList();
		model.addAttribute("gubunList", gubunList);
		model.addAttribute("mode", "created");
		return ".ticket.created";
	}
	
	@RequestMapping(value="/ticket/created", method=RequestMethod.POST)
	public String ticketCreatedSubmit(Ticket dto, Model model) throws Exception{
		service.insertTicket(dto);
		return"redirect:/ticket/list";
	}
	
	@RequestMapping(value="/ticket/article")
	public String ticketArticle( 
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="goodsName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			int goodsCode,Model model) throws Exception{
		
		String dataQuery = "page="+page;
		if(searchValue.length() != 0) {
			dataQuery+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		Ticket ticket = service.readTicket(goodsCode);
		
		model.addAttribute("dto", ticket);
		model.addAttribute("dataQuery", dataQuery);
		
		return ".ticket.article";
		
	}
	
	@RequestMapping(value="/ticket/update", method=RequestMethod.GET)
	public String ticketUpdateForm(int goodsCode,Model model) throws Exception{
		Ticket ticket = service.readTicket(goodsCode);
		if(ticket==null) {
			return "redirect:/ticket/list";
		}
		
		List<String> gubunList = service.gubunList();
		model.addAttribute("gubunList", gubunList);
		model.addAttribute("dto", ticket);
		model.addAttribute("mode", "update");
		return ".ticket.created";
	}
	
	@RequestMapping(value="/ticket/update", method=RequestMethod.POST)
	public String ticketUpdateSubmit(Ticket dto, Model model) throws Exception{
		service.updateTicket(dto);
		return "redirect:/ticket/article?goodsCode="+dto.getGoodsCode();
	}
}
