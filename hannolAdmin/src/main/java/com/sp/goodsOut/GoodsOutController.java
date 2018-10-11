package com.sp.goodsOut;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
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

@Controller("goodsOut.goodsOutController")
public class GoodsOutController {
	@Autowired
	GoodsOutService service;
	
	@Autowired
	MyUtil util;
	
	//리스트
	@RequestMapping(value="/goodsOut/list")
	public String list(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="itemName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchthema", defaultValue="0") String searchthema,
			@RequestParam(value="searchStartDate", defaultValue="") String searchStartDate,
			@RequestParam(value="searchEndDate", defaultValue="") String searchEndDate,
			HttpServletRequest req,
			Model model) throws Exception{

		
		//get방식이면 디코딩 
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			searchStartDate = URLDecoder.decode(searchStartDate, "utf-8");
			searchEndDate = URLDecoder.decode(searchEndDate, "utf-8");
		} 
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("searchthema", searchthema);
		map.put("searchStartDate", searchStartDate);
		map.put("searchEndDate", searchEndDate);  

		int rows = 10; //한페이지에 10개씩 나오기
		int dataCount, total_page = 0;
		dataCount = service.dataCount(map);
		if(dataCount!=0)
			total_page = util.pageCount(rows, dataCount);
		
		//다른사람이 삭제하여 전체 페이지수가 변화된 경우
		if(current_page>total_page) 
			current_page=total_page;
		
		//리스트에 출력할 데이터 가져오기
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<GoodsOut> list = service.listGoodsOut(map);
		
		//리스트 번호
		int listNum, n = 0;
		Iterator<GoodsOut> it = list.iterator();
		while(it.hasNext()) {
			GoodsOut data = it.next();
			listNum = dataCount - (start+n-1);
			data.setListNum(listNum);
			n++;
		}
		
		//검색값이 있다면 인코딩
		String query = "searchthema="+searchthema;
		if(searchValue.length()!=0)
			query += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		if(searchStartDate.length()!=0)
			query += "&searchStartDate="+URLEncoder.encode(searchStartDate, "utf-8")+"&searchEndDate="+URLEncoder.encode(searchEndDate, "utf-8");
		 
		String cp = req.getContextPath();
		String list_url = cp+"/goodsOut/list?"+query;
		String article_url = cp+"/goodsOut/article?page="+current_page+"&"+query;
	
		String paging = util.paging(current_page, total_page, list_url);
		
		//테마 리스트 가져오기
		List<Map<String, Object>> gubunList = service.listGubun();
		
		model.addAttribute("gubunList", gubunList);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		model.addAttribute("article_url", article_url);
		model.addAttribute("paging", paging);
		
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchthema", searchthema); 
		model.addAttribute("searchStartDate", searchStartDate);
		model.addAttribute("searchEndDate", searchEndDate);   
		
		return ".goodsOut.list";
	}
	
	//출고 폼
	@RequestMapping(value="/goodsOut/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		//오늘 날짜 구하기
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		String month2 = month<10?"0"+month:Integer.toString(month);
		int date = cal.get(Calendar.DATE);
		
		String today = year+"-"+month2+"-"+date; 
		
		
		//테마, 업체 리스트 가져오기
		List<Map<String, Object>> gubunList = service.listGubun();
		List<Map<String, Object>> companyList = service.listCompany();

		//jsp로 객체 전송
		model.addAttribute("mode", "created");
		model.addAttribute("gubunList", gubunList);
		model.addAttribute("companyList", companyList);
		model.addAttribute("today", today);
		
		return ".goodsOut.created";
	}
	
	//테마별 아이템 리스트 가져오기 :AJAX-JSON
	@RequestMapping(value="/goodsOut/goodsItem", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> goodsItem(@RequestParam(value="gubunCode") int gubunCode) throws Exception{
		
		//테마별 아이템 리스트 가져오기
		List<Map<String, Object>> itemList = service.listItem(gubunCode);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("itemList", itemList);
		return model;
	}
	
	//출고 추가
	@RequestMapping(value="/goodsOut/created", method=RequestMethod.POST)
	public String createdSubmit(GoodsOut dto) throws Exception{
	
		int goodsCount = service.goodsCount(dto.getGoodsCode()); //상품 총 수량 가져오기
		int totalCount = goodsCount-dto.getQuantity(); //상품 총 수량
		dto.setTotalCount(totalCount);
		
		//입고추가
		service.insertGoodsOut(dto);
		
		return "redirect:/goodsOut/list";
	} 
	
	//상품의 총 개수 가져오기 : AJAX-JSON
	@RequestMapping(value="/goodsOut/goodsItemInfo", method=RequestMethod.GET) 
	@ResponseBody
	public Map<String, Object> goodsItemInfo(@RequestParam(value="goodsCode") int goodsCode) throws Exception{
		
		int goodsTotalCount = service.goodsCount(goodsCode);
		int goodsPrice = service.goodsPrice(goodsCode);
		List<GoodsOut> goodsOutList = service.listGoodsCompany(goodsCode);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("goodsTotalCount", goodsTotalCount);
		model.put("goodsPrice", goodsPrice);
		model.put("goodsOutList", goodsOutList);
		return model;
	}
	
	//글정보
	@RequestMapping(value="/goodsOut/article", method=RequestMethod.GET)
	public String article(@RequestParam(value="num") int num,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchKey", defaultValue="itemName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchthema", defaultValue="0") String searchthema,
			@RequestParam(value="searchStartDate", defaultValue="") String searchStartDate,
			@RequestParam(value="searchEndDate", defaultValue="") String searchEndDate,
			Model model) throws Exception{
		
		//디코딩
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		searchStartDate = URLDecoder.decode(searchStartDate, "utf-8");
		searchEndDate = URLDecoder.decode(searchEndDate, "utf-8");
		
		//쿼리 및 인코딩
		String query = "searchthema="+searchthema;
		if(searchValue.length()!=0)
			query += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		if(searchStartDate.length()!=0)
			query += "&searchStartDate="+URLEncoder.encode(searchStartDate, "utf-8")+"&searchEndDate="+URLEncoder.encode(searchEndDate, "utf-8");
		
	
		GoodsOut dto = service.readGoodsOut(num);
		
		if(dto==null) 
			return "redirect:/goodsOut/list?"+query;
		
		dto.setMemo(util.htmlSymbols(dto.getMemo()));
		
		
	
		//마감 되었는지 확인(마감되었다면 수정 불가 => 마감안됨:0, 마감됨:1) 
		String [] date = dto.getOutDate().split("-");
		String magamY = date[0];
		String magamM = date[1]; 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("magamY", magamY);
		map.put("magamM", magamM);
		int isMagam = service.searchMagam(map);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("isMagam", isMagam);
		
		return ".goodsOut.article";
	}
	
	//출고 수정 폼
	@RequestMapping(value="/goodsOut/update", method=RequestMethod.GET)
	public String updateForm(@RequestParam(value="num") int num,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="itemName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchthema", defaultValue="0") String searchthema,
			@RequestParam(value="searchStartDate", defaultValue="") String searchStartDate,
			@RequestParam(value="searchEndDate", defaultValue="") String searchEndDate,
			Model model) throws Exception{
		
		//디코딩
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		searchStartDate = URLDecoder.decode(searchStartDate, "utf-8");
		searchEndDate = URLDecoder.decode(searchEndDate, "utf-8");
		
		//쿼리 및 인코딩
		String query = "searchthema="+searchthema;
		if(searchValue.length()!=0)
			query += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		if(searchStartDate.length()!=0)
			query += "&searchStartDate="+URLEncoder.encode(searchStartDate, "utf-8")+"&searchEndDate="+URLEncoder.encode(searchEndDate, "utf-8");
		
		GoodsOut dto = null;
		dto = service.readGoodsOut(num);
		if(dto==null)
			return "redirect:/goodsOut/list?page="+page+"&"+query;

		
		//업체 리스트 가져오기
		List<Map<String, Object>> companyList = service.listCompany();
		
		//jsp로 객체 전송
		model.addAttribute("mode", "update");  
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("companyList", companyList);
		
		System.out.println(dto.getTotalCount()); 
		return ".goodsOut.created"; 
	}
	
	//수정 완료
	@RequestMapping(value="/goodsOut/update", method=RequestMethod.POST)
	public String updateSubmit(GoodsOut dto,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="itemName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="searchthema", defaultValue="0") String searchthema,
			@RequestParam(value="searchStartDate", defaultValue="") String searchStartDate,
			@RequestParam(value="searchEndDate", defaultValue="") String searchEndDate) throws Exception{
		
		service.updateGoodsOut(dto);		  
		
		
		//쿼리 및 인코딩
		String query = "page="+page+"&searchthema="+searchthema;
		if(searchValue.length()!=0)
			query += "&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		if(searchStartDate.length()!=0)
			query += "&searchStartDate="+URLEncoder.encode(searchStartDate, "utf-8")+"&searchEndDate="+URLEncoder.encode(searchEndDate, "utf-8");
		
		return "redirect:/goodsOut/article?num="+dto.getOutCode()+"&"+query; 
	}	
}
