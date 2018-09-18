package com.sp.facility;

import java.io.File;
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

@Controller("facility.facilityController")
public class facilityController {
	
	@Autowired
	private FacilityService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/facility/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		model.addAttribute("mode","created");
		
		return ".facility.created";
	}
	
	@RequestMapping(value="/facility/created", method=RequestMethod.POST)
	public String createdSubmit(Facility dto, HttpSession session) throws Exception{
		String root= session.getServletContext().getRealPath("/");
		
		String pathname = root+File.separator+"uploads"+File.separator+"facility";
		service.insertFacility(dto,pathname);
		
		return "redirect:/facility/list";
	}
	
	@RequestMapping(value = "/facility/list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req, Model model,HttpSession session) throws Exception{

		String cp = req.getContextPath();
		String root= session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"facility";
		int rows =10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page-1)*rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Facility> facilityList=service.listFacility(map,pathname);
		
		// 리스트의 번호
		int listNum, n = 0;
		Iterator<Facility> it = facilityList.iterator();
		while (it.hasNext()) {
			Facility data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/facility/list";
		String articleUrl = cp + "/facility/article?page=" + current_page;

		if (query.length() != 0) {
			listUrl = cp + "/facility/list?" + query;
			articleUrl = cp + "/facility/article?page=" + current_page + "&" + query;
		}
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list",facilityList);
		model.addAttribute("page", current_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		return ".facility.list";
	}
	
	// 시설 정보 보기 : AJAX-JSON
	@RequestMapping(value="/facility/article", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> article(@RequestParam(value="num") int num) throws Exception{
		String state = "true";
		
		//글정보 받아오기
		Facility dto = null;
		dto = service.readFacility(num);
		if(dto==null) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("vo", dto);
		
		return model;
	}
	
	
}
