
package com.sp.finance;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

// 2015년 평균기온
// 서울 : -0.9,1.0,6.3,13.3,18.9,23.6,25.8,26.3,22.4,15.5,8.9,1.6
// 제주 : 7.4,7.3,10.4,15.1,18.8,22.0,25.6,26.4,23.2,19.2,15.2,10.0
// 부산 : 4.7,5.4,9.5,13.9,18.8,21.0,23.9,26.1,22.1,18.1,13.6,7.9
// 대구 : 2.3,3.8,9.2,14.6,21.7,22.9,25.0,26.0,20.6,15.8,11.0,4.5
// 광주 : 1.7,3.0,8.0,13.9,19.4,22.5,25.4,26.0,22.0,16.9,11.6,5.3
// 전주 : 1.0,2.5,7.2	,13.9,19.2,22.7,25.1,25.9,21.6,16.1,10.9,4.4
// 대전 : 0.0,1.9,7.2	,13.3,19.5,23.4,25.4,26.4,21.7,15.5,10.1,3.1
// 춘천 : -2.7,-0.3,5.5,12.3,19.1,23.4,25.0,25.6,20.4,13.7,7.9,0.0
// 철원 : -4.0,-1.3,4.0,11.3,17.6,21.6,23.8,24.1,18.9,12.3,6.6,-1.2 

@Controller("finance.chartController")
public class FinanceController {
	@Autowired
	FinanceServiceImpl service;
	
	@RequestMapping(value = "/finance/main")
	public String main() throws Exception {
		return ".finance.main";
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
	
	@RequestMapping(value = "/finance/paymetBar", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String paymentBar() throws Exception {
		JSONArray arr = new JSONArray();
		JSONObject ob;
		
		
		//매출sql부르자!!!
		List<Finance> listP = service.getSalePaymentQuarter();
		
		int[] paySales = new int[4];
		
		for(Finance f : listP) {
			if(f.getQuarter()==1) {
				paySales[0] = f.getSaleAmount();
			}else if(f.getQuarter()==2) {
				paySales[1] = f.getSaleAmount();
			}else if(f.getQuarter()==3) {
				paySales[2] = f.getSaleAmount();
			}else if(f.getQuarter()==4) {
				paySales[3] = f.getSaleAmount();
			}
		}
	
		
		ob = new JSONObject();
		ob.put("name", "분기별 매출");
		ob.put("data", paySales);
		arr.put(ob);
		
		
		//지출sql부르자!!! : 수리 + 입고
		List<Finance> listR = service.getExpenseRepairQuarter();
		List<Finance> listG = service.getExpenseGoodsInQuarter();
		
		int[] expense = new int[4];
		
		for(Finance f : listR) {
			if(f.getQuarter()==1) {
				expense[0] = f.getSaleAmount();
			}else if(f.getQuarter()==2) {
				expense[1] = f.getSaleAmount();
			}else if(f.getQuarter()==3) {
				expense[2] = f.getSaleAmount();
			}else if(f.getQuarter()==4) {
				expense[3] = f.getSaleAmount();
			}
		}
		
		for(Finance f : listG) {
			if(f.getQuarter()==1) {
				expense[0] += f.getSaleAmount();
			}else if(f.getQuarter()==2) {
				expense[1] += f.getSaleAmount();
			}else if(f.getQuarter()==3) {
				expense[2] += f.getSaleAmount();
			}else if(f.getQuarter()==4) {
				expense[3] += f.getSaleAmount();
			}
		}
		
		ob = new JSONObject();
		ob.put("name", "분기별 지출");
		ob.put("data", expense);
		arr.put(ob);
		
		
		JSONObject job = new JSONObject();
		job.put("year", "2018");
		job.put("series", arr);

		return job.toString();

	}

}
