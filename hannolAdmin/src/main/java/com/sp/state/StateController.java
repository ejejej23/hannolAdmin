package com.sp.state;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.facility.Facility;

@Controller("state.StateController")
public class StateController {
	
	@Autowired
	private StateService service;
	
	@RequestMapping(value="/state/list")
	public String list(HttpServletRequest req, Model model) throws Exception{
	
		return ".state.list";
	}
		
	
	@RequestMapping(value="/state/piclist")
	public String piclist(HttpServletRequest req, Model model, Facility dto) throws Exception{
		
		Facility dto1 = new Facility(); 
		String themeName = null;
		int waitNum = 0;
		int picture=0;
		int facilityCode= 0;
		
		dto1 = service.list(dto);
		waitNum = dto1.getWaiting();
		
		if(waitNum<9)
			picture = 1;
		else if(waitNum<19)
			picture = 2;
		else if(waitNum<39)
			picture = 3;
		else if(waitNum<59)
			picture = 4;
		else
			picture=5;
		
		themeName = service.checkName(dto1.getThemeCode());
		facilityCode= dto1.getFacilityCode();
		
		model.addAttribute("dto1",dto1);
		model.addAttribute("picture",picture);
		model.addAttribute("themeName",themeName);
		model.addAttribute("facilityCode", facilityCode);
		
		return ".state.list";
	}
	
	//테마에 따른 놀이기구 list 가져오기(등록부분)
	@RequestMapping(value="/state/checkList")
	public String checkList(Facility dto, Model model) throws Exception{
		System.out.println("********************checkList**************");
		
		List<Facility> checkList = service.checkList(dto.getThemeCode());
		String themeName = service.checkName(dto.getThemeCode());
		
		model.addAttribute("list", checkList);
		model.addAttribute("themeName",themeName);
		
		return ".state.created";
	}
	
	//테마에 따른 놀이기구 list 가져오기(리스트부분)
	@RequestMapping(value="/state/checkListL")
	public String checkListL(Facility dto, Model model) throws Exception{
		System.out.println("********************checkListL**************");
		
		List<Facility> checkList = service.checkList(dto.getThemeCode());
		String themeName = service.checkName(dto.getThemeCode());
		
		model.addAttribute("list", checkList);
		model.addAttribute("themeName",themeName);
		
		return ".state.list";
	}
	
	//현황등록
	@RequestMapping(value="/state/created", method=RequestMethod.GET)
	public String createdForm()throws Exception {
		
		System.out.println("********************createdForm**************");
		return ".state.created";
	}
	
	@RequestMapping(value="/state/created", method=RequestMethod.POST)
	public String createdSubmit(Facility dto) throws Exception{
		
		//현재시간 구하기
		SimpleDateFormat formatter2 = new SimpleDateFormat ("yyyyMMdd");
		SimpleDateFormat formatter3 = new SimpleDateFormat ("hh");
		
		Calendar cal = Calendar.getInstance();
		String yyyymmdd = null;
		String chh = null;
		
		yyyymmdd = formatter2.format(cal.getTime());
		chh = formatter3.format(cal.getTime());
		
		System.out.println("String:"+yyyymmdd);
		System.out.println("String:"+chh);
		
		int hh = Integer.parseInt(chh);
		
		Facility check = new Facility();
		check.setYyyymmdd(yyyymmdd);
		check.setHh(hh);
		check.setWaiting(0);
		
		service.calcul(check);
		
		if(check.getWaiting()==0) {
			System.out.println("********************createdSubmit**************");
			System.out.println(dto.getFacilityCode()+":::"+dto.gettimezone());
		
			service.insertState(dto);

		}else {
			System.out.println("이미등록된 데이터 입니다.");
		}
		
		return ".state.created";
	}
}
