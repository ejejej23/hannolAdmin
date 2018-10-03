package com.sp.visitor;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("visitor.visitorController")
public class VisitorController {
	
	@Autowired
	private VisitorService service;
	
	@RequestMapping(value = "/visitor/main")
	public String main(
			@RequestParam(defaultValue = "0") int year, 
			@RequestParam(defaultValue = "quarter") String gubun,
			Model model) throws Exception {
		
		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		List<Visitor> list = service.getYears();

		model.addAttribute("yearList", list);
		
		return ".visitor.main";
	}
	
	@RequestMapping(value = "/visitor/visitorChart", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String visitorChart(@RequestParam(defaultValue = "0") int year,
			@RequestParam(defaultValue = "quarter") String gubun) throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob;
		JSONObject job = null;

		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		
		List<Visitor> listP = service.getVisitor(map); // 총 이용객
		List<Visitor> listA = service.getVisitorA(map); // 종일 이용객
		List<Visitor> listN = service.getVisitorN(map); // 야간 이용객
		List<Visitor> listY = service.getVisitorY(map); // 연간 이용객
		
		if (gubun.equals("quarter")) {
			
			int[] paySales = new int[4];
			String[] chartX = new String[4];

			for (int i = 0; i < 4; i++) {
				chartX[i] = year + "년 " + (i + 1) + "분기";
			}

			for (Visitor f : listP) {
				if (f.getQuarter() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getQuarter() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getQuarter() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getQuarter() == 4) {
					paySales[3] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "line");
			ob.put("name", "분기별 총 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			paySales = new int[4];
			for (Visitor f : listA) {
				if (f.getQuarter() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getQuarter() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getQuarter() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getQuarter() == 4) {
					paySales[3] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "column");
			ob.put("name", "종일 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			paySales = new int[4];
			for (Visitor f : listN) {
				if (f.getQuarter() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getQuarter() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getQuarter() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getQuarter() == 4) {
					paySales[3] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "column");
			ob.put("name", "야간 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			paySales = new int[4];
			for (Visitor f : listY) {
				if (f.getQuarter() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getQuarter() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getQuarter() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getQuarter() == 4) {
					paySales[3] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "column");
			ob.put("name", "연간 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			job = new JSONObject();
			job.put("year", year);
			job.put("series", arr);
			job.put("chartX", chartX);
		}else {
			int[] paySales = new int[12];
			String[] chartX = new String[12];

			for (int i = 0; i < 12; i++) {
				chartX[i] = (i + 1) + "월";
			}
			
			for (Visitor f : listP) {
				if (f.getMonth() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getMonth() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getMonth() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getMonth() == 4) {
					paySales[3] += f.getTotalCount();
				} else if (f.getMonth() == 5) {
					paySales[4] += f.getTotalCount();
				} else if (f.getMonth() == 6) {
					paySales[5] += f.getTotalCount();
				} else if (f.getMonth() == 7) {
					paySales[6] += f.getTotalCount();
				} else if (f.getMonth() == 8) {
					paySales[7] += f.getTotalCount();
				} else if (f.getMonth() == 9) {
					paySales[8] += f.getTotalCount();
				} else if (f.getMonth() == 10) {
					paySales[9] += f.getTotalCount();
				} else if (f.getMonth() == 11) {
					paySales[10] += f.getTotalCount();
				} else if (f.getMonth() == 12) {
					paySales[11] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "line");
			ob.put("name", "월별 총 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			paySales = new int[12];
			for (Visitor f : listA) {
				if (f.getMonth() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getMonth() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getMonth() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getMonth() == 4) {
					paySales[3] += f.getTotalCount();
				} else if (f.getMonth() == 5) {
					paySales[4] += f.getTotalCount();
				} else if (f.getMonth() == 6) {
					paySales[5] += f.getTotalCount();
				} else if (f.getMonth() == 7) {
					paySales[6] += f.getTotalCount();
				} else if (f.getMonth() == 8) {
					paySales[7] += f.getTotalCount();
				} else if (f.getMonth() == 9) {
					paySales[8] += f.getTotalCount();
				} else if (f.getMonth() == 10) {
					paySales[9] += f.getTotalCount();
				} else if (f.getMonth() == 11) {
					paySales[10] += f.getTotalCount();
				} else if (f.getMonth() == 12) {
					paySales[11] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "column");
			ob.put("name", "종일 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			paySales = new int[12];
			for (Visitor f : listN) {
				if (f.getMonth() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getMonth() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getMonth() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getMonth() == 4) {
					paySales[3] += f.getTotalCount();
				} else if (f.getMonth() == 5) {
					paySales[4] += f.getTotalCount();
				} else if (f.getMonth() == 6) {
					paySales[5] += f.getTotalCount();
				} else if (f.getMonth() == 7) {
					paySales[6] += f.getTotalCount();
				} else if (f.getMonth() == 8) {
					paySales[7] += f.getTotalCount();
				} else if (f.getMonth() == 9) {
					paySales[8] += f.getTotalCount();
				} else if (f.getMonth() == 10) {
					paySales[9] += f.getTotalCount();
				} else if (f.getMonth() == 11) {
					paySales[10] += f.getTotalCount();
				} else if (f.getMonth() == 12) {
					paySales[11] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "column");
			ob.put("name", "야간 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			paySales = new int[12];
			for (Visitor f : listY) {
				if (f.getMonth() == 1) {
					paySales[0] += f.getTotalCount();
				} else if (f.getMonth() == 2) {
					paySales[1] += f.getTotalCount();
				} else if (f.getMonth() == 3) {
					paySales[2] += f.getTotalCount();
				} else if (f.getMonth() == 4) {
					paySales[3] += f.getTotalCount();
				} else if (f.getMonth() == 5) {
					paySales[4] += f.getTotalCount();
				} else if (f.getMonth() == 6) {
					paySales[5] += f.getTotalCount();
				} else if (f.getMonth() == 7) {
					paySales[6] += f.getTotalCount();
				} else if (f.getMonth() == 8) {
					paySales[7] += f.getTotalCount();
				} else if (f.getMonth() == 9) {
					paySales[8] += f.getTotalCount();
				} else if (f.getMonth() == 10) {
					paySales[9] += f.getTotalCount();
				} else if (f.getMonth() == 11) {
					paySales[10] += f.getTotalCount();
				} else if (f.getMonth() == 12) {
					paySales[11] += f.getTotalCount();
				}
			}

			ob = new JSONObject();
			ob.put("type", "column");
			ob.put("name", "연간 이용객 수");
			ob.put("data", paySales);
			arr.put(ob);
			
			job = new JSONObject();
			job.put("year", year);
			job.put("series", arr);
			job.put("chartX", chartX);
		}
		
		return job.toString();
	}
	
	
	@RequestMapping(value = "/visitor/visitorLinePeriod", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String visitorLinePeriod(@RequestParam String startDate, @RequestParam String endDate) throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob = new JSONObject();
		JSONObject job = new JSONObject();

		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		List<Visitor> list = service.visitorLinePeriod(map);
		List<Visitor> listA = service.visitorALinePeriod(map);
		List<Visitor> listN = service.visitorNLinePeriod(map);
		List<Visitor> listY = service.visitorYLinePeriod(map);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date start = formatter.parse(startDate);
		Date end = formatter.parse(endDate);

		long diff = end.getTime() - start.getTime();
		int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
		
		int[] visitors = new int[diffDays];	
		int[] visitorsA = new int[diffDays];
		int[] visitorsN = new int[diffDays];
		int[] visitorsY = new int[diffDays];
		String[] chartX = new String[diffDays];

		Calendar cal = new GregorianCalendar(Locale.KOREA);
		
		int tempnum = 0;

		for (int i = 0; i < diffDays; i++) {
			cal.setTime(start);
			cal.add(Calendar.DAY_OF_YEAR, i);

			String temp = formatter.format(cal.getTime());
			chartX[i] = temp;

			if (tempnum < list.size()) {
				if (temp.equals(list.get(tempnum).getPayDate())) {
					visitors[i] += list.get(tempnum).getTotalCount();
					tempnum++;
				}
			}
		}
		
		tempnum = 0;

		for (int i = 0; i < diffDays; i++) {
			cal.setTime(start);
			cal.add(Calendar.DAY_OF_YEAR, i);

			String temp = formatter.format(cal.getTime());
			chartX[i] = temp;

			if (tempnum < listA.size()) {
				if (temp.equals(listA.get(tempnum).getPayDate())) {
					visitorsA[i] += listA.get(tempnum).getTotalCount();
					tempnum++;
				}
			}
		}
		
		tempnum = 0;

		for (int i = 0; i < diffDays; i++) {
			cal.setTime(start);
			cal.add(Calendar.DAY_OF_YEAR, i);

			String temp = formatter.format(cal.getTime());
			chartX[i] = temp;

			if (tempnum < listN.size()) {
				if (temp.equals(listN.get(tempnum).getPayDate())) {
					visitorsN[i] += listN.get(tempnum).getTotalCount();
					tempnum++;
				}
			}
		}
		
		tempnum = 0;

		for (int i = 0; i < diffDays; i++) {
			cal.setTime(start);
			cal.add(Calendar.DAY_OF_YEAR, i);

			String temp = formatter.format(cal.getTime());
			chartX[i] = temp;

			if (tempnum < listY.size()) {
				if (temp.equals(listY.get(tempnum).getPayDate())) {
					visitorsY[i] += listY.get(tempnum).getTotalCount();
					tempnum++;
				}
			}
		}
		
		ob.put("type", "line");
		ob.put("name", "총 이용객 수");
		ob.put("data", visitors);
		arr.put(ob);

		ob = new JSONObject();
		ob.put("type", "line");
		ob.put("name", "종일 이용객 수");
		ob.put("data", visitorsA);
		arr.put(ob);
		
		ob = new JSONObject();
		ob.put("type", "line");
		ob.put("name", "야간 이용객 수");
		ob.put("data", visitorsN);
		arr.put(ob);
		
		ob = new JSONObject();
		ob.put("type", "line");
		ob.put("name", "연간 이용객 수");
		ob.put("data", visitorsY);
		arr.put(ob);
		
		job = new JSONObject();
		job.put("series", arr);
		job.put("chartX", chartX);
		
		return job.toString();
	}
}
