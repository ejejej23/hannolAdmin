package com.sp.assets;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.ticket.Ticket;

@Controller("assets.assetsController")
public class AssetsController {
	@Autowired
	AssetsService service;
	
	@Autowired
	private MyUtil util;
	
	
	//리스트
	@RequestMapping(value="/assets/list")
	public String list(Model model) {
		
		//오늘 날짜 가져오기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		Calendar cal = Calendar.getInstance();
		String today = sdf.format(cal.getTime());
		
		//테마리스트 가져오기
		List<Map<String, Object>> themeList = service.themeList();
		
		model.addAttribute("today", today);
		model.addAttribute("themeList", themeList);
		
		return ".assets.list";  
	}
	
	//대여 현황 리스트: AJAX 
	@RequestMapping(value="/assets/assetsStatusList", method=RequestMethod.POST)
	public String assetsStatusList(
			@RequestParam(value="tab", defaultValue="1") int tab,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchthema", defaultValue="0") String searchthema,
			Model model) throws Exception{
		  
		  
		int rows = 10; //한페이지에 보여질 데이터 개수  
		int assetsDataCount = 0; //전체 데이터 개수
		int total_page = 0; //전체 페이지 개수
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gubunCode", tab);
		map.put("searchthema", searchthema);  
		
		assetsDataCount = service.assetsDataCount(map);
		if(assetsDataCount != 0)
			total_page = util.pageCount(rows, assetsDataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		
		//페이징 처리 준비
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		//테마별 편의시설 수량 리스트 가져오기
		List<Assets> assetsCountList = service.assetsCountList(map);
		
		//대여수량 검색해서 대여수량에 넣기
		Iterator<Assets> it = assetsCountList.iterator();
		int rentCount = 0; //시설코드
		int facility = 0;  //대여수량
		while(it.hasNext()) {
			Assets data = it.next();
			facility = data.getFacilityCode(); 
			rentCount = service.searchRentCount(facility); 
			data.setRentCount(rentCount);      
		}
		
		//페이징 
		String methodName = "statusPageList";
		String countPaging = util.pagingMethod(current_page, total_page, methodName);
		
		
		//AJAX로 데이터 보내기
		model.addAttribute("assetsCountList", assetsCountList);
		model.addAttribute("assetsDataCount", assetsDataCount);
		model.addAttribute("countPaging", countPaging);
		model.addAttribute("page", current_page);
		
		return "/assets/list-status";
	}
	
	//현장 등록
	@RequestMapping(value="/assets/insertRent", method=RequestMethod.POST)
	@ResponseBody 
	public Map<String, Object> insertRent(
			Assets dto,
			@RequestParam(value="facilityNum") int facilityNum) throws Exception{
		
		String state = "true";
		
		//전화번호
		String tel = dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3();
		dto.setTel(tel); 
		
		//시설 코드
		int assetsCode = service.searchAssetsCode(facilityNum); 
		dto.setAssetsCode(assetsCode);
		
		int result = service.insertRent(dto);
		if(result==0)
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;  
	};
	
	//대여 신청 리스트 : AJAX 
	@RequestMapping(value="/assets/assetsReservationList", method=RequestMethod.POST)
	public String assetsReservationList(
			@RequestParam(value="tab", defaultValue="1") int tab,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchthema", defaultValue="0") String searchthema,
			@RequestParam(value="searchKey", defaultValue="id") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		int rows = 10; //한페이지에 보여질 데이터 개수; 
		int assetsReservationDataCount = 0; //전체 데이터 개수
		int total_page = 0; //전체 페이지 개수
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gubunCode", tab);
		map.put("searchthema", searchthema);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

	
		assetsReservationDataCount = service.assetsReservationDataCount(map);
		if(assetsReservationDataCount!=0)
			total_page = util.pageCount(rows, assetsReservationDataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		
		//페이징 처리 준비
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Assets> assetsReservationList = service.assetsReservationList(map);
		
		//페이징
		String methodName = "reservationPageList";
		String reservationPaging = util.pagingMethod(current_page, total_page, methodName);
		
		model.addAttribute("assetsReservationList", assetsReservationList);
		model.addAttribute("assetsReservationDataCount", assetsReservationDataCount);
		model.addAttribute("reservationPaging", reservationPaging);
		model.addAttribute("page", current_page);
		
		return "/assets/list-reservation";
	}	
	
	//대여 완료 리스트 : AJAX 
	@RequestMapping(value="/assets/rentalOkList", method=RequestMethod.POST)
	public String rentalOkList(
			@RequestParam(value="tab", defaultValue="1") int tab,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchthema", defaultValue="0") String searchthema,
			@RequestParam(value="searchKey", defaultValue="id") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		int rows = 10; //한페이지에 보여질 데이터 개수
		int rentalOkDataCount = 0; //전체 데이터 개수 
		int total_page = 0; //전체 페이지 개수
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gubunCode", tab);
		map.put("searchthema", searchthema);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		rentalOkDataCount = service.rentalOkCount(map); 
		if(rentalOkDataCount != 0) 
			total_page = util.pageCount(rows, rentalOkDataCount);  
		
		if(current_page > total_page) 
			current_page = total_page;
		
		
		//페이징 처리 준비
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Assets> rentalOkList = service.rentalOkList(map); 
		
		//페이징
		String methodName = "rentalOkListPage";
		String rentalOkpaging = util.pagingMethod(current_page, total_page, methodName);
  
		model.addAttribute("rentalOkList", rentalOkList);
		model.addAttribute("rentalOkDataCount", rentalOkDataCount);
		model.addAttribute("rentalOkpaging", rentalOkpaging);
		model.addAttribute("page", current_page);
		
		return "/assets/list-rentalOk"; 
	}
	
	//편의시설 예약 상태변경 AJAX-JSON
	@RequestMapping(value="/assets/rentUpdate", method=RequestMethod.POST)
	@ResponseBody 
	public Map<String, Object> rentUpdate(
			@RequestParam(value="bookCode") int bookCode,
			@RequestParam(value="stateCode") int stateCode){

		String state = "true";  
		  
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bookCode", bookCode);
		map.put("stateCode", stateCode);
		
		int result = service.rentUpdate(map);
		
		if(result==0) 
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	// 이용권 검색 AJAX-JSON
	@RequestMapping(value="/assets/searchTicket", method=RequestMethod.POST)
	@ResponseBody 
	public Map<String, Object> searchTicket(@RequestParam(value="ticketCode") int ticketCode) throws Exception{

		String state = "true";  
		  
		
		Ticket searchTicket = service.searchTicket(ticketCode);
		
		if(searchTicket==null)  
			state = "false";
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("searchTicket", searchTicket); 
		
		return model;
	}
}
