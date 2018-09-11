package com.sp.giftshop;

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

@Controller("giftshop.giftShopController")
public class GiftShopController {

	@Autowired
	private GiftShopService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/giftshop/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {

		List<String> gubunList = service.gubunList();

		model.addAttribute("mode", "created");
		model.addAttribute("gubunList", gubunList);
		return ".giftshop.created";
	}

	@RequestMapping(value = "/giftshop/created", method = RequestMethod.POST)
	public String createdSubject(GiftShop dto, HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"giftShopGoods";
		
		service.insertGiftGoods(dto, pathname);
		
		return "redirect:/giftshop/list";
	}

	@RequestMapping(value = "/giftshop/list")
	public String listForm(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="goodsName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 6;
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
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<GiftShop> list =  service.listGiftGoods(map);
		
		String query = "";
		String listUrl = cp+"/giftshop/list";
		String articleUrl = cp+"/giftshop/article?page"+current_page;
		if(searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl+="?"+query;
			articleUrl+="&"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".giftshop.list";
	}

}
