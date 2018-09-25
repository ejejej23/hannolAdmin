package com.sp.coupon;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.ticket.Ticket;

@Controller("coupon.couponController")
public class CouponController {

	@Autowired
	private CouponService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/coupon/list")
	public String couponList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="couponMngName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 10;
		int total_page = 0;
		int dataCount =0;
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
		
		List<Coupon> list = service.listCoupon(map);
		// 리스트의 번호
		int listNum, n = 0;
		Iterator<Coupon> it = list.iterator();
		while (it.hasNext()) {
			Coupon data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String cp = req.getContextPath();
		
		String query = "";
		String articleUrl = cp+"/coupon/article?page="+current_page;
		if(searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length() != 0) {
			articleUrl+="&"+query;
		}
				
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("query", query);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".coupon.list";
	}

	@RequestMapping(value = "/coupon/created", method = RequestMethod.GET)
	public String insertCoupon(Model model) throws Exception {

		List<Ticket> list = service.goodsList();
		
		model.addAttribute("list", list);
		model.addAttribute("mode", "created");
		return ".coupon.created";
	}
	
	@RequestMapping(value = "/coupon/created", method = RequestMethod.POST)
	public String submitCoupon(Coupon coupon, Model model) throws Exception {
		
		if(coupon.getUsersGubun().equals("all")) {
			coupon.setUserGubun(1);
		}else if(coupon.getUsersGubun().equals("normal")) {
			coupon.setUserGubun(2);
		}else if(coupon.getUsersGubun().equals("gold")) {
			coupon.setUserGubun(3);
		}else if(coupon.getUsersGubun().equals("vip")) {
			coupon.setUserGubun(4);
		}
		
		int result = service.insertCoupon(coupon);
		if(result==0) {
			model.addAttribute("msg", "발송에 실패했습니다. 다시 시도해주세요");
			return ".coupon.created";
		}
		
		return "redirect:/coupon/list";
	}
	
	@RequestMapping(value = "/coupon/article", method = RequestMethod.GET)
	public String updateCoupon(
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="couponMngName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			int mngCode, 
			Model model) throws Exception {
		
		Coupon dto = service.readCoupon(mngCode);
		if(dto==null) {
			return "redirect:/coupon/list";
		}
		
		List<Ticket> list = service.goodsList();
		
		String dataQuery = "page="+page;
		
		if(searchValue.length() != 0) {
			dataQuery+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("dataQuery", dataQuery);
		
		return ".coupon.article";
	}
	
	@RequestMapping(value = "/coupon/delete", method = RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> deleteCoupon(int mngCode) throws Exception{
		Map<String, Object> model = new HashMap<>();
		
		int result = service.deleteCoupon(mngCode);
		if(result==0) {
			model.put("state", "fail");
		}else {
			model.put("state", "success");
		}
		
		return model;
	}

		
}
