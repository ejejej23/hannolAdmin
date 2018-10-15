package com.sp.amenity;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller("amenity.amenityController")
public class AmenityController {
	
	@Autowired
	private AmenityService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/amenity/storage")
	public String storageForm(Model model) {

		String themeName = "프린세스빌리지";
		String day = "종일";
		
		model.addAttribute("themeName",themeName);
		model.addAttribute("day", day);
		
		return ".amenity.storage";
	}
	
	@RequestMapping(value="/amenity/storage1")
	public String storageSubmit(
			@RequestParam(value="themeName" ,defaultValue = "프린세스빌리지") String themeName,
			@RequestParam(value="day", defaultValue = "종일") String day, Model model) {
		
		System.out.println("---------------------안녕============================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		SimpleDateFormat formatter2 = new SimpleDateFormat ("yyyyMMdd");
		SimpleDateFormat formatter3 = new SimpleDateFormat ("kk");
		
		int daynum=0;
		
		Date today = new Date();
		String date = formatter2.format(today);
		
		Calendar cal = Calendar.getInstance();
		
		String chh = null;
		chh = formatter3.format(cal.getTime());
		int hh = Integer.parseInt(chh);
		System.out.println("시간::::::::"+hh);
		
		if(day.equals("종일"))
			daynum=0;
		else if(day.equals("오후"))
			daynum=1;
		else
			daynum=2;
		
		map.put("themeName", themeName);
		map.put("yyyymmdd", date);
		map.put("daynum",daynum);

		
		System.out.println(themeName+"::::::::"+day+":::::::::");
		System.out.println(date+"::::::::::::::오늘날짜");
		System.out.println(hh+"::::::::::::::지금시간");
		
		//남은 보관함 수 
		int use = service.datanum(map);
		int unuse =10 - use;
		
		System.out.println("남은보관함 수::::::::::::::"+unuse);
		
		//해당 테마의 오늘 날짜에 예약된 보관함들
		
		Amenity dto=new Amenity();
		
		List<Amenity> list = service.checkList(map);
		
		dto.setLock1(0);
		dto.setLock2(0);
		dto.setLock3(0);
		dto.setLock4(0);
		dto.setLock5(0);
		dto.setLock6(0);
		dto.setLock7(0);
		dto.setLock8(0);
		dto.setLock9(0);
		dto.setLock10(0);
		
		for(Amenity e :list) {
			System.out.println("+++++++"+e.getLockerNum()+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			if(e.getLockerNum()==1)
				dto.setLock1(1);
			else if(e.getLockerNum()==2)
				dto.setLock2(2);
			else if(e.getLockerNum()==3)
				dto.setLock3(3);
			else if(e.getLockerNum()==4)
				dto.setLock4(4);
			else if(e.getLockerNum()==5)
				dto.setLock5(5);
			else if(e.getLockerNum()==6)
				dto.setLock6(6);
			else if(e.getLockerNum()==7)
				dto.setLock7(7);
			else if(e.getLockerNum()==8)
				dto.setLock8(8);
			else if(e.getLockerNum()==9)
				dto.setLock9(9);
			else
				dto.setLock10(10);
		}
		
		System.out.println(dto.getLock1()+":::"+dto.getLock2()+":::"+dto.getLock10());
		
		//보관함을 리스트가 아니라 번호당 받아서 보내줘야함
		
		model.addAttribute("unuse", unuse);
		model.addAttribute("dto", dto);
		
		return "/amenity/substorage";
	}

	@RequestMapping(value="/amenity/cancel")
	public String cancel(Model model) {

		SimpleDateFormat formatter2 = new SimpleDateFormat ("yyyyMMdd");
		
		Date today = new Date();
		String date = formatter2.format(today);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("yyyymmdd", date);
		
		int cc = service.checkcc(map);
		if(cc==0) {
			model.addAttribute("back","반납할 보관함이 없습니다.");
			return ".amenity.storage";
		}
		else {
			List<Amenity> list = service.checknum(map);
		
			for(Amenity e: list) {
				int num = e.getBookCode();
				map.put("num", num);
				service.lockercancel(map);
			}
			
			service.cancel(map);
		}
		
		model.addAttribute("back","반납완료");
		
		return ".amenity.storage";
	}
	
}
