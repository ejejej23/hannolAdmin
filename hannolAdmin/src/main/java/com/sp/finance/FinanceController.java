
package com.sp.finance;

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

@Controller("finance.chartController")
public class FinanceController {
	@Autowired
	FinanceServiceImpl service;

	@RequestMapping(value = "/finance/main")
	public String main(@RequestParam(defaultValue = "0") int year,
			@RequestParam(defaultValue = "quarter") String gubun, Model model) throws Exception {
		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		List<Finance> list = service.getYears();

		model.addAttribute("yearList", list);
		
		return ".finance.main";
	}

	@RequestMapping(value = "/finance/profit")
	public String profit(@RequestParam(defaultValue = "0") int year,
			@RequestParam(defaultValue = "quarter") String gubun, Model model) throws Exception {
		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		List<Finance> list = service.getYears();

		model.addAttribute("yearList", list);

		return ".finance.profit";
	}

	@RequestMapping(value = "/finance/loss")
	public String loss(@RequestParam(defaultValue = "0") int year,
			@RequestParam(defaultValue = "quarter") String gubun, Model model) throws Exception {
		
		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		List<Finance> list = service.getYears();

		model.addAttribute("yearList", list);
		
		return ".finance.loss";
	}

	@RequestMapping(value = "/finance/line1", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String line1() throws Exception {
		/*
		 * // highchart 에 출력하는 데이터 형식. 값은 숫자이어야함 [{name:'이름', data:[값]}]
		 * 
		 * [{ name: '서울', data:
		 * [-0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6] }, { name: '제주',
		 * data: [7.4,7.3,10.4,15.1,18.8,22.0,25.6,26.4,23.2,19.2,15.2,10.0] }]
		 */

		JSONArray arr = new JSONArray();
		JSONObject ob = new JSONObject();
		ob.put("name", "서울");
		ob.put("data", new double[] { -0.9, 1.0, 6.3, 13.3, 18.9, 23.6, 25.8, 26.3, 22.4, 15.5, 8.9, 1.6 });
		arr.put(ob);

		return arr.toString();

	}

	@RequestMapping(value = "/finance/line2", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String line2() throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob;

		ob = new JSONObject();
		ob.put("name", "서울");
		ob.put("data", new double[] { -0.9, 1.0, 6.3, 13.3, 18.9, 23.6, 25.8, 26.3, 22.4, 15.5, 8.9, 1.6 });
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "제주");
		ob.put("data", new double[] { 7.4, 7.3, 10.4, 15.1, 18.8, 22.0, 25.6, 26.4, 23.2, 19.2, 15.2, 10.0 });
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "철원");
		ob.put("data", new double[] { -4.0, -1.3, 4.0, 11.3, 17.6, 21.6, 23.8, 24.1, 18.9, 12.3, 6.6, -1.2 });
		arr.put(ob);

		JSONObject job = new JSONObject();
		job.put("year", "2015");
		job.put("series", arr);

		return job.toString();

	}

	@RequestMapping(value = "/finance/bar", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String bar() throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob;

		ob = new JSONObject();
		ob.put("name", "서울");
		ob.put("data", new double[] { -0.9, 1.0, 6.3, 13.3, 18.9, 23.6, 25.8, 26.3, 22.4, 15.5, 8.9, 1.6 });
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "제주");
		ob.put("data", new double[] { 7.4, 7.3, 10.4, 15.1, 18.8, 22.0, 25.6, 26.4, 23.2, 19.2, 15.2, 10.0 });
		arr.put(ob);

		ob = new JSONObject();
		ob.put("name", "철원");
		ob.put("data", new double[] { -4.0, -1.3, 4.0, 11.3, 17.6, 21.6, 23.8, 24.1, 18.9, 12.3, 6.6, -1.2 });
		arr.put(ob);

		JSONObject job = new JSONObject();
		job.put("year", "2015");
		job.put("series", arr);

		return job.toString();

	}

	@RequestMapping(value = "/finance/pie3d", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String pie3d() throws Exception {
		JSONArray arr = new JSONArray();

		JSONObject ob = new JSONObject();
		ob.put("name", "접속자");

		JSONArray ja = new JSONArray();
		ja.put(new JSONArray("['07-10시', 10]"));
		ja.put(new JSONArray("['10-13시', 30]"));
		ja.put(new JSONArray("['13-16시', 33]"));
		ja.put(new JSONArray("['16-19시', 20]"));
		ja.put(new JSONArray("['기타', 10]"));

		ob.put("data", ja);

		arr.put(ob);

		System.out.println(arr.toString());
		return arr.toString();

	}

	@RequestMapping(value = "/finance/paymentBar", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String paymentBar(@RequestParam(defaultValue = "0") int year) throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob;

		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}

		// 매출sql부르자!!!
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);

		List<Finance> listP = service.getSalePayment(map);
		System.out.println(listP.size());

		int[] paySales = new int[4];
		String[] chartX = new String[4];

		for (int i = 0; i < 4; i++) {
			chartX[i] = year + "년 " + (i + 1) + "분기";
		}

		for (Finance f : listP) {
			if (f.getQuarter() == 1) {
				paySales[0] = f.getSaleAmount();
			} else if (f.getQuarter() == 2) {
				paySales[1] = f.getSaleAmount();
			} else if (f.getQuarter() == 3) {
				paySales[2] = f.getSaleAmount();
			} else if (f.getQuarter() == 4) {
				paySales[3] = f.getSaleAmount();
			}
		}

		ob = new JSONObject();
		ob.put("name", "분기별 매출");
		ob.put("data", paySales);
		arr.put(ob);

		// 지출sql부르자!!! : 수리 + 입고
		List<Finance> listR = service.getExpenseRepair(map);
		List<Finance> listG = service.getExpenseGoodsIn(map);

		int[] expense = new int[4];

		for (Finance f : listR) {
			if (f.getQuarter() == 1) {
				expense[0] = f.getSaleAmount();
			} else if (f.getQuarter() == 2) {
				expense[1] = f.getSaleAmount();
			} else if (f.getQuarter() == 3) {
				expense[2] = f.getSaleAmount();
			} else if (f.getQuarter() == 4) {
				expense[3] = f.getSaleAmount();
			}
		}

		for (Finance f : listG) {
			if (f.getQuarter() == 1) {
				expense[0] += f.getSaleAmount();
			} else if (f.getQuarter() == 2) {
				expense[1] += f.getSaleAmount();
			} else if (f.getQuarter() == 3) {
				expense[2] += f.getSaleAmount();
			} else if (f.getQuarter() == 4) {
				expense[3] += f.getSaleAmount();
			}
		}

		ob = new JSONObject();
		ob.put("name", "분기별 지출");
		ob.put("data", expense);
		arr.put(ob);

		JSONObject job = new JSONObject();
		job.put("year", year);
		job.put("series", arr);
		job.put("chartX", chartX);

		return job.toString();

	}

	@RequestMapping(value = "/finance/profitLine", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String profitLine(@RequestParam(defaultValue = "0") int year,
			@RequestParam(defaultValue = "quarter") String gubun) throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob = new JSONObject();
		JSONObject job = new JSONObject();

		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("year", year);

		List<Finance> listP = service.getSalePayment(map);

		if (gubun.equals("quarter")) {

			int[] paySales = new int[4];
			String[] chartX = new String[4];

			for (int i = 0; i < 4; i++) {
				chartX[i] = year + "년 " + (i + 1) + "분기";
			}

			for (Finance f : listP) {
				if (f.getQuarter() == 1) {
					paySales[0] += f.getSaleAmount();
				} else if (f.getQuarter() == 2) {
					paySales[1] += f.getSaleAmount();
				} else if (f.getQuarter() == 3) {
					paySales[2] += f.getSaleAmount();
				} else if (f.getQuarter() == 4) {
					paySales[3] += f.getSaleAmount();
				}
			}

			ob.put("name", "분기별 매출");
			ob.put("data", paySales);
			arr.put(ob);

			job = new JSONObject();
			job.put("year", year);
			job.put("series", arr);
			job.put("chartX", chartX);

		} else {
			int[] paySales = new int[12];
			String[] chartX = new String[12];

			for (int i = 0; i < 12; i++) {
				chartX[i] = (i + 1) + "월";
			}

			for (Finance f : listP) {
				if (f.getMonth() == 1) {
					paySales[0] += f.getSaleAmount();
				} else if (f.getMonth() == 2) {
					paySales[1] += f.getSaleAmount();
				} else if (f.getMonth() == 3) {
					paySales[2] += f.getSaleAmount();
				} else if (f.getMonth() == 4) {
					paySales[3] += f.getSaleAmount();
				} else if (f.getMonth() == 5) {
					paySales[4] += f.getSaleAmount();
				} else if (f.getMonth() == 6) {
					paySales[5] += f.getSaleAmount();
				} else if (f.getMonth() == 7) {
					paySales[6] += f.getSaleAmount();
				} else if (f.getMonth() == 8) {
					paySales[7] += f.getSaleAmount();
				} else if (f.getMonth() == 9) {
					paySales[8] += f.getSaleAmount();
				} else if (f.getMonth() == 10) {
					paySales[9] += f.getSaleAmount();
				} else if (f.getMonth() == 11) {
					paySales[10] += f.getSaleAmount();
				} else if (f.getMonth() == 12) {
					paySales[11] += f.getSaleAmount();
				}
			}

			ob.put("name", "월별 매출");
			ob.put("data", paySales);
			arr.put(ob);

			job = new JSONObject();
			job.put("year", year);
			job.put("series", arr);
			job.put("chartX", chartX);
		}

		return job.toString();
	}

	@RequestMapping(value = "/finance/profitLinePeriod", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String profitLinePeriod(@RequestParam String startDate, @RequestParam String endDate) throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob = new JSONObject();
		JSONObject job = new JSONObject();

		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		List<Finance> list = service.profitLinePeriod(map);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date start = formatter.parse(startDate);
		Date end = formatter.parse(endDate);

		long diff = end.getTime() - start.getTime();
		int diffDays = (int) (diff / (24 * 60 * 60 * 1000));

		int[] paySales = new int[diffDays];
		String[] chartX = new String[diffDays];

		Calendar cal = new GregorianCalendar(Locale.KOREA);
		
		int tempnum=0;

		for (int i = 0; i < diffDays; i++) {
			cal.setTime(start);
			cal.add(Calendar.DAY_OF_YEAR, i);

			String temp = formatter.format(cal.getTime());
			chartX[i] = temp;
			
			if(tempnum<list.size()) {
				if (temp.equals(list.get(tempnum).getPayDate())) {
					paySales[i] += list.get(tempnum).getSaleAmount();
					tempnum++;
				}
			}
			
		}

		ob.put("name", "조회기간 매출");
		ob.put("data", paySales);
		arr.put(ob);

		job = new JSONObject();
		job.put("series", arr);
		job.put("chartX", chartX);

		return job.toString();
	}
	
	@RequestMapping(value = "/finance/lossLine", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String lossLine(@RequestParam(defaultValue = "0") int year,
			@RequestParam(defaultValue = "quarter") String gubun) throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob = new JSONObject();
		JSONObject job = new JSONObject();

		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("year", year);

		List<Finance> listP = service.getSalePayment(map);

		if (gubun.equals("quarter")) {

			int[] paySales = new int[4];
			String[] chartX = new String[4];

			for (int i = 0; i < 4; i++) {
				chartX[i] = year + "년 " + (i + 1) + "분기";
			}

			for (Finance f : listP) {
				if (f.getQuarter() == 1) {
					paySales[0] += f.getSaleAmount();
				} else if (f.getQuarter() == 2) {
					paySales[1] += f.getSaleAmount();
				} else if (f.getQuarter() == 3) {
					paySales[2] += f.getSaleAmount();
				} else if (f.getQuarter() == 4) {
					paySales[3] += f.getSaleAmount();
				}
			}

			ob.put("name", "분기별 지출");
			ob.put("data", paySales);
			arr.put(ob);

			job = new JSONObject();
			job.put("year", year);
			job.put("series", arr);
			job.put("chartX", chartX);

		} else {
			int[] paySales = new int[12];
			String[] chartX = new String[12];

			for (int i = 0; i < 12; i++) {
				chartX[i] = (i + 1) + "월";
			}

			for (Finance f : listP) {
				if (f.getMonth() == 1) {
					paySales[0] += f.getSaleAmount();
				} else if (f.getMonth() == 2) {
					paySales[1] += f.getSaleAmount();
				} else if (f.getMonth() == 3) {
					paySales[2] += f.getSaleAmount();
				} else if (f.getMonth() == 4) {
					paySales[3] += f.getSaleAmount();
				} else if (f.getMonth() == 5) {
					paySales[4] += f.getSaleAmount();
				} else if (f.getMonth() == 6) {
					paySales[5] += f.getSaleAmount();
				} else if (f.getMonth() == 7) {
					paySales[6] += f.getSaleAmount();
				} else if (f.getMonth() == 8) {
					paySales[7] += f.getSaleAmount();
				} else if (f.getMonth() == 9) {
					paySales[8] += f.getSaleAmount();
				} else if (f.getMonth() == 10) {
					paySales[9] += f.getSaleAmount();
				} else if (f.getMonth() == 11) {
					paySales[10] += f.getSaleAmount();
				} else if (f.getMonth() == 12) {
					paySales[11] += f.getSaleAmount();
				}
			}

			ob.put("name", "월별 지출");
			ob.put("data", paySales);
			arr.put(ob);

			job = new JSONObject();
			job.put("year", year);
			job.put("series", arr);
			job.put("chartX", chartX);
		}

		return job.toString();
	}

	@RequestMapping(value = "/finance/lossLinePeriod", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String lossLinePeriod(@RequestParam String startDate, @RequestParam String endDate) throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob = new JSONObject();
		JSONObject job = new JSONObject();

		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		List<Finance> list = service.profitLinePeriod(map);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date start = formatter.parse(startDate);
		Date end = formatter.parse(endDate);

		long diff = end.getTime() - start.getTime();
		int diffDays = (int) (diff / (24 * 60 * 60 * 1000));

		int[] paySales = new int[diffDays];
		String[] chartX = new String[diffDays];

		Calendar cal = new GregorianCalendar(Locale.KOREA);
		
		int tempnum=0;

		for (int i = 0; i < diffDays; i++) {
			cal.setTime(start);
			cal.add(Calendar.DAY_OF_YEAR, i);

			String temp = formatter.format(cal.getTime());
			chartX[i] = temp;
			
			if(tempnum<list.size()) {
				if (temp.equals(list.get(tempnum).getPayDate())) {
					paySales[i] += list.get(tempnum).getSaleAmount();
					tempnum++;
				}
			}
			
		}

		ob.put("name", "조회기간 지출");
		ob.put("data", paySales);
		arr.put(ob);

		job = new JSONObject();
		job.put("series", arr);
		job.put("chartX", chartX);

		return job.toString();
	}
}
