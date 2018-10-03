package com.sp.faq;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.common.MyUtil;
import com.sp.staff.SessionInfo;

@Controller("faq.faqController")
public class FaqController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FaqService service;
	
	@RequestMapping(value="/faq/list")
	public String faqList(
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="msg", defaultValue="") String msg,
			Model model) throws Exception{
		
		List<Faq> gubunlist = service.faqGubunList();
		model.addAttribute("gubunlist", gubunlist);
		model.addAttribute("tab", tab);
		model.addAttribute("page", page);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("msg", msg);
		
		return ".faq.list";
	}
	
	@RequestMapping(value="/faq/ajaxList")
	public String faqAjaxList(
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception{
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchValue", searchValue);
		map.put("tab", tab);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);

		List<Faq> list = service.faqList(map);
		
		String cp = req.getContextPath();
		
		String query = "";
		String articleUrl = cp+"/faq/article?page="+current_page+"&tab="+tab;
		if(searchValue.length() != 0) {
			query = "searchValue=" + URLEncoder.encode(searchValue, "utf-8");
			articleUrl +="&searchValue="+ URLEncoder.encode(searchValue, "utf-8");
		}
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		model.addAttribute("articleUrl", articleUrl);
		
		return "/faq/list-body";
	}
	
	@RequestMapping(value="/faq/created", method=RequestMethod.GET)
	public String createdFaq(
			@RequestParam(value="msg", defaultValue="") String msg,
			Model model) throws Exception{
		List<Faq> gubunlist = service.faqGubunList();
		
		model.addAttribute("gubunlist", gubunlist);
		model.addAttribute("msg", msg);
		model.addAttribute("mode", "created");
		
		return ".faq.created";
	}
	
	@RequestMapping(value="/faq/created", method=RequestMethod.POST)
	public String createdSubmitFaq(Faq dto, HttpSession session, RedirectAttributes redirectAttributes) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("staff");
		long sttafCode = info.getStaffIdx();
		dto.setUsersCode(sttafCode);
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		int result = service.insertFaq(dto);
		if(result==0) {
			redirectAttributes.addAttribute("msg", "등록을 하지 못했습니다. 다시 시도해 주세요");
			redirectAttributes.addAttribute("mode", "created");
			redirectAttributes.addAttribute("dto", dto);
			return "redirect:/faq/created";
		}
		
		return "redirect:/faq/list";
	}
	
	@RequestMapping(value="/faq/article")
	public String articleFaq(
			long faqCode, 
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="page", defaultValue="1") String page,
			RedirectAttributes redirectAttributes,
			Model model) throws Exception{
		
		String query = "page="+page;
		if(searchValue.length() != 0) {
			query+="&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		Faq dto = service.readFaq(faqCode);
		if(dto==null) {
			redirectAttributes.addAttribute("msg", "해당 게시물이 없습니다.");
			redirectAttributes.addAttribute("tab", tab);
			if(searchValue.length() != 0) {
				redirectAttributes.addAttribute("searchValue", searchValue);				
			}
			redirectAttributes.addAttribute("page", page);
			return "redirect:/faq/list";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		return ".faq.article";
	}
	
	@RequestMapping(value="/faq/update", method=RequestMethod.GET)
	public String updateForm(
			long faqCode, 
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="msg", defaultValue="") String msg,
			RedirectAttributes redirectAttributes,
			Model model) throws Exception{
		
		Faq dto = service.readFaq(faqCode);
		if(dto==null) {
			redirectAttributes.addAttribute("msg", "해당 게시물이 없습니다.");
			redirectAttributes.addAttribute("tab", tab);
			if(searchValue.length() != 0) {
				redirectAttributes.addAttribute("searchValue", searchValue);				
			}
			redirectAttributes.addAttribute("page", page);
			return "redirect:/faq/list";
		}
		
		dto.setContent(myUtil.removeHtmlTag(dto.getContent()));
		
		String query = "page="+page;
		if(searchValue.length() != 0) {
			query+="&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		List<Faq> gubunlist = service.faqGubunList();
		
		model.addAttribute("gubunlist", gubunlist);
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		redirectAttributes.addAttribute("msg", msg);
		
		return ".faq.created";
	}
	
	@RequestMapping(value="/faq/update", method=RequestMethod.POST)
	public String updateSubmitFaq(
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="page", defaultValue="1") String page,
			Faq dto, 
			HttpSession session, 
			RedirectAttributes redirectAttributes) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("staff");
		long sttafCode = info.getStaffIdx();
		dto.setUsersCode(sttafCode);
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		int result = service.updateFaq(dto);
		redirectAttributes.addAttribute("tab", tab);
		if(searchValue.length() != 0) {
			redirectAttributes.addAttribute("searchValue", searchValue);				
		}
		redirectAttributes.addAttribute("page", page);
		
		if(result==0) {
			redirectAttributes.addAttribute("msg", "수정을 하지 못하였습니다. 다시 시도해 주세요");
			redirectAttributes.addAttribute("mode", "update");
			redirectAttributes.addAttribute("faqCode", dto.getFaqCode());
			return "redirect:/faq/update";
		}
		
		redirectAttributes.addAttribute("faqCode", dto.getFaqCode());
		return "redirect:/faq/article";
	}
	
	@RequestMapping(value="/faq/delete")
	public String deleteFaq(
			long faqCode, 
			@RequestParam(value="tab", defaultValue="all") String tab,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="page", defaultValue="1") String page,
			RedirectAttributes redirectAttributes) throws Exception{
		
		redirectAttributes.addAttribute("tab", tab);
		if(searchValue.length() != 0) {
			redirectAttributes.addAttribute("searchValue", searchValue);				
		}
		redirectAttributes.addAttribute("page", page);
		
		Faq dto = service.readFaq(faqCode);
		if(dto==null) {
			return "redirect:/faq/list";
		}
		
		int result = service.deleteFaq(faqCode);
		if(result==0) {
			redirectAttributes.addAttribute("msg", "수정을 하지 못하였습니다. 다시 시도해 주세요");
			redirectAttributes.addAttribute("faqCode", faqCode);
			return "redirect:/faq/update";
		}else {
			redirectAttributes.addAttribute("msg", "삭제되었습니다.");
		}
		
		return "redirect:/faq/list";
	}
}