package com.sp.payment;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.amenity.Amenity;
import com.sp.amenity.AmenityService;
import com.sp.common.MyUtil;
import com.sp.guide.Guide;
import com.sp.guide.GuideService;
import com.sp.reservation.ReservationService;
import com.sp.schedule.ShowService;

@Controller("payment.paymentController")
public class PaymentController {
	@Autowired
	PaymentService service;
	
	@Autowired
	GuideService gservice;
	
	@Autowired
	AmenityService aservice;
	
	@Autowired
	ReservationService rservice;
	
	@Autowired
	private MyUtil util;

	@RequestMapping(value = "/payment/list")
	public String reservationList(@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam(value = "thema", defaultValue = "0") String thema, 
			@RequestParam(defaultValue = "0") int year,
			@RequestParam(value = "searchKey", defaultValue = "all") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model) throws Exception{
		
		if (year == 0) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}
		
		List<Payment> list = service.getYears();
		
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		
		
		model.addAttribute("page", page);
		model.addAttribute("thema", thema);
		model.addAttribute("yearList", list);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("year", year);
		
		return ".payment.list";
	}
	
	@RequestMapping(value = "/payment/ajaxPaymentList")
	public String aJaxListForm(
			@RequestParam(value = "page", defaultValue = "1") int current_page, 
			@RequestParam(value = "searchKey", defaultValue = "all") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			int thema,
			int year,
			HttpSession session, 
			HttpServletRequest req, 
			Model model) throws Exception {
		
		int rows = 3;
		int start = (current_page-1)*rows+1;
		int end = current_page * rows;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("thema", thema+1);
		map.put("start", start);
		map.put("end", end);
		map.put("year", year);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		int dataCount = service.dataCount(map);
		int total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		String cp = req.getContextPath();
		String query = "";
		if(searchValue != null) {
			query = "&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		String list_url = cp + "/payment/list?thema="+thema+query;
		String paging = util.paging(current_page, total_page, list_url);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date date = new Date();
		String endDate = format.format(date);
		map.put("endDate", endDate);

		List<Integer> uselist = service.useDate(map);
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
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("thema", thema);
			model.addAttribute("uselist", uselist);
			model.addAttribute("searchKey", searchKey);
			model.addAttribute("searchValue", searchValue);
		}
		
		return "/payment/list-body";
	}
	
	@RequestMapping(value = "/payment/refundPay")
	public String paylist(int payCode, int thema,
			@RequestParam(value = "searchKey", defaultValue = "all") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			HttpServletRequest req
			) throws Exception {
		
		
		deleteIfPayCanceled(payCode);
		rservice.readTicketCodeByPayCode(payCode);
		service.deleteRefund(payCode);
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		String query = "";
		if(searchValue != null) {
			query = "&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		
		return "redirect:/payment/list?thema="+thema+query;
	}
	
	public void deleteIfPayCanceled(@RequestParam(value = "payCode") int payCode) throws Exception {

		// 결제취소할 이용권의 사용예정일에 가이드 예약이 있는지 검사
		Guide dto = gservice.getGuideBookCancleDay(payCode);

		if (dto != null) { // 취소할 가이드 예약이 있다면
			if (dto.getTimezone() == 1) {
				// 예약한 가이드일정이 오전일 때
				int okTicket = gservice.okMorningTicketIfPayCancled(payCode);
				
				if (okTicket == 0) {
					// 사용가능 티켓이 0개면 가이드 예약 취소
					gservice.deleteGuidebookIfPayCanceled(payCode);
				}
			} else {
				// 예약한 가이드일정이 오후일 때
				// 취소할 결제코드에서 이용권 사용일자 가져오고 그 일자에 사용가능한 이용권이 남는지 검사(지금 결제취소할 이용권외)
				int okTicket = gservice.okTicketIfPayCancled(payCode);
				if (okTicket == 0) {
					// 사용가능 티켓이 0개면 가이드 예약 취소
					gservice.deleteGuidebookIfPayCanceled(payCode);
				}
			}
		}
		
		Amenity adto = aservice.getCubeBookCancelDay(payCode);
		
		if(adto !=null) {
			int okTicketcube = aservice.okTicketIfPayCancledCube(payCode);
			if(okTicketcube==0) {
				//삭제할 예약번호 가져오기
				int cubepayCode = aservice.payBookCode(payCode);
				System.out.println(cubepayCode+":::::::삭제할 번호 가져옴::");
				//예약된 보관함 삭제
				aservice.paydeleteLocker(cubepayCode);
				//예약된 코드 삭제
				aservice.paydeleteBook(cubepayCode);
			}
		}
		
	}

}
