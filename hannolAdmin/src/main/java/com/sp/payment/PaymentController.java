package com.sp.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("payment.paymentController")
public class PaymentController {
	@Autowired
	PaymentService service;
	
	@Autowired
	private MyUtil util;

	@RequestMapping(value = "/payment/list")
	public String reservationList(@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam(value = "thema", defaultValue = "0") String thema, 
			Model model) {
		
		model.addAttribute("page", page);
		model.addAttribute("thema", thema);
		
		return ".payment.list";
	}
	
	@RequestMapping(value = "/payment/ajaxPaymentList")
	public String aJaxListForm(
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			int thema,
			HttpSession session, 
			HttpServletRequest req, 
			Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("thema", thema+1);
		map.put("start", 1);
		map.put("end", 3);
		map.put("year", "2018");
		
		List<Payment> list = service.getTicketPayment(map);
		if (list != null && list.size() > 0) {
			int count = list.get(list.size() - 1).getRnum();
			int rowspan = 1;
			for (int j = 1; j <= count; j++) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getRnum() == j)
						rowspan++;
				}
				for (int i = 0; i < list.size(); i++) {
					list.get(i).setRowspan(rowspan);
				}
			}
			
			model.addAttribute("list", list);
		}
		
		
		return "/payment/list-body";
	}

}
