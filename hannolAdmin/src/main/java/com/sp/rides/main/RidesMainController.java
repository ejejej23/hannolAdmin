package com.sp.rides.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("main.ridesMainController")
public class RidesMainController {
	
	@Autowired
	private RidesMainService service;
	
	@RequestMapping(value="/rides/main")
	public String ridesChartList(Model model) throws Exception{
		List<RidesMain> thema =  service.themaGubun();
		
		model.addAttribute("thema", thema);
		return ".ridesMain.main";
	}
	
	@RequestMapping(value="/rides/getYear")
	@ResponseBody
	public Map<String, Object> ridesGetYears(int themaCode) throws Exception{
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("themaCode", themaCode);
		
		List<RidesMain> yearList = service.yearsList(paramMap);
		Map<String, Object> model = new HashMap<>();
		model.put("yearList", yearList);
		return model;
	}
	
	@RequestMapping(value="/rides/chartData", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String chartData(
				@RequestParam(value="thema") int themaCode,
				@RequestParam(value="searchGubun") String searchGubun,
				@RequestParam(value="years", defaultValue="") String years,
				@RequestParam(value="searchStartDate", defaultValue="") String searchStartDate,
				@RequestParam(value="searchEndDate", defaultValue="") String searchEndDate
			) throws Exception{
		JSONArray arr = new JSONArray();
		JSONObject ob;
		JSONObject job = null;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("themaCode", themaCode);
		paramMap.put("years", years);
		
		if(searchGubun.equals("self")) {
			
		}else if(searchGubun.equals("quarter")){
			List<RidesMain> list = null;
			if(themaCode==4) {
				//테마 전체의 분기 뿌리기
				list = service.getVisitorAll(paramMap);
				
				int totalCount[] = new int[4];
				int countP[] = new int[4];
				int countT[] = new int[4];
				int countM[] = new int[4];
				int countL[] = new int[4];
				int countN[] = new int[4];
				
				String chartX[] = new String[4];
				
				for(int i=0; i<4; i++) {
					chartX[i] = years+"년"+(i+1)+"분기";
				}
				
				System.out.println(list.size()+"size:::::::::::::::::::::");
				
				for(RidesMain dto : list) {
					if(dto.getQuarter()==1) {
						System.out.println(dto.getQuarter()+"Querter:::::::::::::::::::::");
						totalCount[0]+=dto.getTotalCount();
						switch (dto.getThemaCode()) {
							case 1:
								System.out.println("::::::::::::::::::"+dto.getTotalCount());
								countP[0] += dto.getTotalCount();
								break;
							case 2:
								countT[0] += dto.getTotalCount();
								break;
							case 3:
								countM[0] += dto.getTotalCount();
								break;
							case 5:
								countL[0] += dto.getTotalCount();
								break;
							case 6:
								countN[0] += dto.getTotalCount();
								break;
						}
					}else if(dto.getQuarter()==2) {
						totalCount[1]+=dto.getTotalCount();
						switch (dto.getThemaCode()) {
							case 1:
								countP[1] += dto.getTotalCount();
								break;
							case 2:
								countT[1] += dto.getTotalCount();
								break;
							case 3:
								countM[1] += dto.getTotalCount();
								break;
							case 5:
								countL[1] += dto.getTotalCount();
								break;
							case 6:
								countN[1] += dto.getTotalCount();
								break;
						}
					}else if(dto.getQuarter()==3) {
						totalCount[2]+=dto.getTotalCount();
						switch (dto.getThemaCode()) {
							case 1:
								countP[2] += dto.getTotalCount();
								break;
							case 2:
								countT[2] += dto.getTotalCount();
								break;
							case 3:
								countM[2] += dto.getTotalCount();
								break;
							case 5:
								countL[2] += dto.getTotalCount();
								break;
							case 6:
								countN[2] += dto.getTotalCount();
								break;
						}
					}else if(dto.getQuarter()==4) {
						totalCount[3]+=dto.getTotalCount();
						switch (dto.getThemaCode()) {
							case 1:
								countP[3] += dto.getTotalCount();
								break;
							case 2:
								countT[3] += dto.getTotalCount();
								break;
							case 3:
								countM[3] += dto.getTotalCount();
								break;
							case 5:
								countL[3] += dto.getTotalCount();
								break;
							case 6:
								countN[3] += dto.getTotalCount();
								break;
						}
					}
				}
				
				ob = new JSONObject();
				ob.put("name", "분기별 놀이기구 이용객");
				ob.put("data", totalCount);
				arr.put(ob);
				
				ob = new JSONObject();
				ob.put("name", "프린세스빌리지");
				ob.put("data", countP);
				arr.put(ob);
				
				ob = new JSONObject();
				ob.put("name", "토이스토리");
				ob.put("data", countT);
				arr.put(ob);
				
				ob = new JSONObject();
				ob.put("name", "미니언즈");
				ob.put("data", countM);
				arr.put(ob);
				
				ob = new JSONObject();
				ob.put("name", "라이온킹");
				ob.put("data", countL);
				arr.put(ob);
				
				ob = new JSONObject();
				ob.put("name", "니모");
				ob.put("data", countN);
				arr.put(ob);
				
				job = new JSONObject();
				job.put("series", arr);
				job.put("chartX", chartX);
			}else {
				//선택한 테마의 놀이기구 별 분기 뿌리기
			}
		}else if(searchGubun.equals("month")) {
			
		}
		
		
		
		return job.toString();
	}
}
