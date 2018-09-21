package com.sp.rides;

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

@Controller("rides.ridesController")
public class RidesController {
	
	@Autowired
	private RidesService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/rides/ridesInfocreated", method=RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> ridesInfocreated(Rides dto) throws Exception{
		String state="ture";
		
		int result=service.insertRidesInfo(dto);
		
		if(result==0)
			state="false";
		
		System.out.println(dto.getFacilityCode()+":::::::::::::::::::::::::::::::::::::::::::::::::::::");
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/rides/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		model.addAttribute("mode","created");
		
		return ".rides.created";
	}
	
	@RequestMapping(value="/rides/created", method=RequestMethod.POST)
	public String createdSubmit(Rides dto) throws Exception{
		
		service.insertRides(dto);
		
		return "redirect:/rides/list";
	}
	
	@RequestMapping(value = "/rides/Infolist")
	public String ridesInfoList(@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		System.out.println("시설상세 Info들어왔다~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");
		
		model.addAttribute("page",page);
		return ".rides.Infolist";
	}
	
	@RequestMapping(value="/rides/Infogetlist")
	public String ridesInfoList(@RequestParam(value="page",defaultValue="1") int current_page,
						HttpServletRequest req, Model model) throws Exception{
		String cp = req.getContextPath();
		
		int rows =10;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		dataCount = service.InfodataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page-1)*rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Rides> InforidesList=service.InfolistRides(map);
		
		// 리스트의 번호
		int listNum, n = 0;
		Iterator<Rides> it = InforidesList.iterator();
		while (it.hasNext()) {
			Rides data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/rides/Infolist";
		String articleUrl = cp + "/rides/article?page=" + current_page;

		if (query.length() != 0) {
			listUrl = cp + "/rides/Infolist?" + query;
			articleUrl = cp + "/rides/article?page=" + current_page + "&" + query;
		}
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list",InforidesList);
		model.addAttribute("page", current_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);

		return "/rides/sub-Infolist";
	}
	
	@RequestMapping(value = "/rides/list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		System.out.println("ㅣist들어왔다~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");

		model.addAttribute("page",page);
		return ".rides.list";
	}
	
	@RequestMapping(value="/rides/getlist")
	public String list(@RequestParam(value="page",defaultValue="1") int current_page,
						HttpServletRequest req, Model model) throws Exception{
		String cp = req.getContextPath();
		
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
		
		List<Rides> ridesList=service.listRides(map);
		
		// 리스트의 번호
		int listNum, n = 0;
		Iterator<Rides> it = ridesList.iterator();
		while (it.hasNext()) {
			Rides data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/rides/list";
		String articleUrl = cp + "/rides/article?page=" + current_page;

		if (query.length() != 0) {
			listUrl = cp + "/rides/list?" + query;
			articleUrl = cp + "/rides/article?page=" + current_page + "&" + query;
		}
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list",ridesList);
		model.addAttribute("page", current_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);

		return "/rides/sub-list";
	}

	@RequestMapping(value="/rides/article")
	public String article(int facilityCode, @RequestParam(value = "page") String page,
						Model model) throws Exception{
		
		String query="page="+page;
		
		Rides dto = service.readRides(facilityCode);
		if(dto == null) {
			return "redirect:/rides/list?"+query;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".rides.article";
	}
	
	@RequestMapping(value="/rides/update")
	public String update(@RequestParam(value="lists[]")  String[] lists,
			@RequestParam(value="selCode") int selCode) {
		if(lists.length==0) {
			System.out.println("선택된 체크가 없음");
		}
		
		Rides dto = new Rides();
		
		for(int i=0; i<lists.length; i++) {
			System.out.println(lists[i]);
			int code = Integer.parseInt(lists[i]);  
			
			dto.setFacilityCode(code);
			dto.setGubunCode(selCode);
			service.updateRides(dto);
		}
		
		System.out.println("다 갔다왔당~!");
		
		return ".rides.list";
	}
	
/*	@RequestMapping(value="/rides/listName")
	public String listName(@RequestParam(value="lists[]")  String[] lists {
		if(lists.length==0) {
			System.out.println("이름이 없음");
		}
		
		Rides dto = new Rides();
		
		for(int i=0; i<lists.length; i++) {
			System.out.println(lists[i]);
			int code = Integer.parseInt(lists[i]);  
			
			dto.setFacilityCode(code);
			dto.setGubunCode(selCode);
			service.updateRides(dto);
		}
		
		System.out.println("다 갔다왔당~!");
		
		return ".rides.list";
	}
	*/
	
	
	
	@RequestMapping(value="/rides/Infoupdate")
	public String Infoupdate(@RequestParam(value="lists[]")  String[] lists,
			@RequestParam(value="selCode") int selCode) {
		if(lists.length==0) {
			System.out.println("선택된 체크가 없음");
		}
		
		Rides dto = new Rides();
		
		for(int i=0; i<lists.length; i++) {
			System.out.println(lists[i]);
			int code = Integer.parseInt(lists[i]);  
			
			dto.setFacilityCode(code);
			++i;
			code = Integer.parseInt(lists[i]);
			dto.setRidesInfoCode(code);
			dto.setState(selCode);
			
			service.updateInfoRides(dto);
		}
		
		System.out.println("다 갔다왔당~!");
		
		return ".rides.Infolist";
	}

	@RequestMapping(value="/rides/updateChg", method=RequestMethod.GET)
	public String updateForm(int facilityCode, Model model, int page) throws Exception{
		
		Rides dto = service.readRides(facilityCode);
		if(dto.getFacilityCode()== 0) {
			return "redirect:/rides/list";
		}

		model.addAttribute("mode", "updateChg");
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		
		return ".rides.created";
	}
	
	@RequestMapping(value="/rides/updateChg", method=RequestMethod.POST)
	public String updateSubmit(Rides dto, int page) throws Exception{
		service.updateRidesChg(dto);
		
		System.out.println("e드디어 왔도다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		
		return "redirect:/rides/article?facilityCode="+dto.getFacilityCode()+"&page="+page;
	}
	
}
