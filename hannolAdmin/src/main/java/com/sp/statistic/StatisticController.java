package com.sp.statistic;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("statistic.chartController")
public class StatisticController {
/*
	@Autowired
	StatisticServiceImpl service;*/
	
	@RequestMapping(value = "/statistic/main")
	public String main() throws Exception {
		return ".statistic.main";
	}

	@RequestMapping(value = "/statistic/line1", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String line1() throws Exception {

		JSONArray arr = new JSONArray();
		JSONObject ob = new JSONObject();
		/*
		List<Facility> list = service
		*/
		
		
		
		ob.put("name", "서울");
		ob.put("data", new double[] { -0.9, 1.0, 6.3, 13.3, 18.9, 23.6, 25.8, 26.3, 22.4, 15.5, 8.9, 1.6 });
		arr.put(ob);

		return arr.toString();

	}
	
}
	/*
	
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
*/