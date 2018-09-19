package com.sp.repair;


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

@Controller("repair.repairContoller")
public class RepairController {
	@Autowired
	private RepairService service;
	
	@Autowired
	private MyUtil util;
	
	
	@RequestMapping(value="/repair/list")
	public String list(@RequestParam (value="page", defaultValue="1") int current_page,
			@RequestParam (value="searchKey", defaultValue="kind") String searchKey,
			@RequestParam (value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchState", defaultValue="3") String searchState,
			@RequestParam(value="searchStartDate", defaultValue="") String searchStartDate,
			@RequestParam(value="searchEndDate", defaultValue="") String searchEndDate,
			HttpServletRequest req,
			Model model) throws Exception{
		
		//get방식일 경우만 디코딩딩
		if(req.getMethod().equalsIgnoreCase("GET"))
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("searchState", searchState);
		map.put("searchStartDate",searchStartDate);
		map.put("searchEndDate", searchEndDate);
		
		int rows = 10; //한페이지에 보여일 데이터 개수
		int dataCount, total_page = 0;
		dataCount = service.dataCount(map); //데이터 총 개수
		
		if(dataCount!=0)
			total_page = util.pageCount(rows, dataCount); //전체 페이지 개수
		
		//다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(current_page>total_page) 
			current_page = total_page;
		
		
		//리스트에 출력할 데이터들 가져오기
		int start = (current_page-1)*rows+1; //한페이지에 보여질 데이터 첫번째 번호
		int end = current_page*rows; //한페이지에 보여질 데이터 마지막 번호
		map.put("start", start);
		map.put("end", end);
		
		//리스트 가져오기
		List<Repair> list = service.listRepair(map);
		
		//리스트 번호
		int listNum, n = 0;
		Iterator<Repair> it = list.iterator();
		while(it.hasNext()) {
			Repair data = it.next();
			listNum = dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		
		//쿼리 및 인코딩
		String query = "";
		if(searchValue.length()!=0) 
			query = "searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		
		String cp = req.getContextPath();
		String list_url = cp+"/repair/list";
		String article_url = cp+"/repair/article?page="+current_page;
		if(query.length()!=0) {
			list_url += "?"+query;
			article_url += "&"+query;
		}
		
		//페이징
		String paging = util.paging(current_page, total_page, list_url);
		
		//모달창
		//시설구분 리스트, 시설 리스트
		List<Map<String, Object>> facGubunlist = service.listFacGubun();
		List<Map<String, Object>> facList = service.listFacility(1);
		List<Map<String, Object>> companyList = service.listCompany();
		
		model.addAttribute("facGubunlist", facGubunlist); 
		model.addAttribute("facList", facList);
		model.addAttribute("companyList", companyList);
		
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("article_url", article_url);
		
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchStartDate", searchStartDate);
		model.addAttribute("searchEndDate", searchEndDate);
		model.addAttribute("searchState", searchState);

		return ".repair.list";
	}
	
	//시설 분류 선택시 시설 가져오기 : AJAX-JSON
	@RequestMapping(value="/repair/facility", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> facility(@RequestParam(value="gubunCode") int gubunCode) throws Exception{
		
		//시설 구분별 시설 리스트
		List<Map<String, Object>> facList = service.listFacility(gubunCode);
				
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("facList", facList);
		
		return model; 
	}
	
	//시설 등록
	@RequestMapping(value="/repair/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> created(Repair dto)throws Exception{
		
		String state = "true";
		int result = service.insertRepair(dto);
		if(result==0)
			state="false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state); 
		return model;
	}
	
	//글정보 : AJAX-JSON
	@RequestMapping(value="/repair/article", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> article(@RequestParam(value="num") int num) throws Exception{
		
		String state = "true";
		
		Repair dto = null;
		dto = service.readRepair(num);
		if(dto==null)
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("dto", dto);
		
		return model;
	}
	
	//글수정 : AJAX-JSON
	@RequestMapping(value="/repair/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(Repair dto) throws Exception {
		
		String state = "true";
		
		int result = service.updateRepair(dto);
		if(result==0)
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	//글삭제 : AJAX-JSON
	@RequestMapping(value="/repair/delete", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> delete(@RequestParam(value="repairCode") int repairCode) throws Exception{
		
		String state = "true";
		
		int result = service.deleteRepair(repairCode);
		if(result==0)
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
}
