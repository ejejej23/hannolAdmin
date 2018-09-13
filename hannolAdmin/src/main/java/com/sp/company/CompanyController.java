package com.sp.company;

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

@Controller("company.companyController")
public class CompanyController {
	@Autowired
	private CompanyService service;
	
	@Autowired
	private MyUtil util;
	
	
	//리스트
	@RequestMapping(value="/company/list") 
	public String list(@RequestParam(value="page",  defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="companyName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{

		//get방식일 경우만 디코딩
		if (req.getMethod().equalsIgnoreCase("GET")) 
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		int rows = 10; //한페이지에 보여질 데이터 개수
		int dataCount, total_page = 0;
		dataCount = service.dataCount(map); //데이터 총 개수
		if(dataCount!=0)	
			total_page = util.pageCount(rows, dataCount); //총 페이지 개수
		
		//다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(current_page > total_page)
			total_page = current_page;
		
		
		//리스트에 출력할 데이터들 가져오기
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Company> list = service.listCompany(map);
		
		//리스트 번호
		int listNum, n = 0;
		Iterator<Company> it = list.iterator();
		while(it.hasNext()) {
			Company data = it.next();
			listNum = dataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String list_url;
		String article_url;
		//검색값이 있다면 인코딩
		if(searchValue.length()!=0)
			query += "searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		
		String cp = req.getContextPath();
		list_url = cp+"/company/list";
		article_url = cp+"/company/article?page="+current_page;
		if(query.length()!=0) {
			list_url += "?"+query;
			article_url += "&"+query;
		}
		
		//페이징
		String paging = util.paging(current_page, total_page, list_url);
		
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("article_url", article_url);
				
		return ".company.list";
	}
	
	
	// 업체 정보 등록 : AJAX-JSON
	@RequestMapping(value="/company/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> created(Company dto) throws Exception{
		String state="true";
		
		String tel = dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3();
		dto.setTel(tel);
		int result = service.insertCompany(dto);
		if(result==0)
			state="false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	// 업체 정보 보기 : AJAX-JSON
	@RequestMapping(value="/company/article", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> article(@RequestParam(value="num") int num) throws Exception{
		
		String state = "true";
		
		//글정보 받아오기
		Company dto = null;
		dto = service.readCompany(num);
		if(dto==null)
			state = "false";
		else {
			//전화번호
			String []tel = dto.getTel().split("-");
			dto.setTel1(tel[0]);
			dto.setTel2(tel[1]);
			dto.setTel3(tel[2]);
		}
		
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("dto", dto);
		
		return model;
	}
	
	// 업체 수정 : AJAX-JSON
	@RequestMapping(value="/company/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(Company dto, 
			@RequestParam(value="companyCode2") int companyCode) throws Exception{
		
		String state = "true";
		
		//전화번호
		String tel = dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3();
		dto.setTel(tel);
		dto.setCompanyCode(companyCode); 
		
		//수정
		int result = service.updateCompany(dto);
		if(result==0)
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	// 업체 삭제 : AJAX-JSON
	@RequestMapping(value="/company/delete", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> delete(@RequestParam(value="companyCode") int companyCode) throws Exception{
		
		String state = "true";
		
		int result = service.deleteCompany(companyCode);
		if(result==0)
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	
}
