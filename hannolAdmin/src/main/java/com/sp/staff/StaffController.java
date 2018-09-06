package com.sp.staff;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("staff.memberController")
public class StaffController {
	@Autowired
	private StaffService service;
	
	@RequestMapping(value="/staff/staff", method=RequestMethod.GET)
	public String memberForm(Model model) {
		model.addAttribute("mode", "created");
		return ".staff.staff";
	}

	@RequestMapping(value="/staff/staff", method=RequestMethod.POST)
	public String memberSubmit(Staff dto,
			Model model) {

		/*int result=service.insertMember(dto);
		if(result==1) {
			StringBuffer sb=new StringBuffer();
			sb.append(dto.getUserName()+ "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
			
			model.addAttribute("message", sb.toString());
			model.addAttribute("title", "회원 가입");
			
			return ".member.complete";
		} 
		
		model.addAttribute("mode", "created");
		model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");*/
			
		return ".staff.staff";
	}
	
	@RequestMapping(value="/staff/login", method=RequestMethod.GET)
	public String loginForm() {
		return ".staff.login";
	}
	
	@RequestMapping(value="/staff/login", method=RequestMethod.POST)
	public String loginSubmit(
			@RequestParam String staffId,
			@RequestParam String staffPwd,
			HttpSession session,
			Model model
			) {
		
		
		Staff dto=service.loginStaff(staffId);
		if(dto==null ||  !  staffPwd.equals(dto.getStaffPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".staff.login";
		}
		
		// 세션에 로그인 정보 저장
		SessionInfo info=new SessionInfo();
		info.setStaffId(dto.getStaffId());
		info.setStaffName(dto.getName());
		
		session.setMaxInactiveInterval(30*60); // 세션유지시간 30분, 기본:30분
		
		session.setAttribute("staff", info);
		
		// 로그인 이전 URI로 이동
		String uri=(String)session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if(uri==null)
			uri="redirect:/";
		else
			uri="redirect:"+uri;
		
		return uri;
	}
	
	@RequestMapping(value="/staff/logout")
	public String logout(HttpSession session) {
		// 세션에 저장된 정보 지우기
		session.removeAttribute("staff");
		
		// 세션에 저장된 모든 정보 지우고, 세션초기화
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/staff/pwd", method=RequestMethod.GET)
	public String pwdForm(
			String dropout,
			Model model) {
		
		if(dropout==null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}
		
		return ".staff.pwd";
	}
	
	@RequestMapping(value="/staff/pwd", method=RequestMethod.POST)
	public String pwdSubmit(
			@RequestParam String staffPwd,
			@RequestParam String mode,
			Model model,
			HttpSession session
	     ) {
		/*
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Member dto=service.readMember(info.getUserId());
		if(dto==null) {
			session.invalidate();
			return "redirect:/";
		}
		
		if(! dto.getUserPwd().equals(userPwd)) {
			if(mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}
		
		if(mode.equals("dropout")){
			// 게시판 테이블등 자료 삭제
			
			// 회원탈퇴 처리
			
			Map<String, Object> map = new HashMap<>();
			map.put("memberIdx", info.getMemberIdx());
			map.put("userId", info.getUserId());
			

			// 세션 정보 삭제
			session.removeAttribute("member");
			session.invalidate();

			StringBuffer sb=new StringBuffer();
			sb.append(dto.getUserName()+ "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
			
			model.addAttribute("title", "회원 탈퇴");
			model.addAttribute("message", sb.toString());
			
			return ".member.complete";
		}

		// 회원정보수정폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");*/
		return ".staff.staff";
	}

	@RequestMapping(value="/staff/update",
			method=RequestMethod.POST)
	public String updateSubmit(
			Staff dto,
			Model model) {
		
		/*service.updateMember(dto);
		
		StringBuffer sb=new StringBuffer();
		sb.append(dto.getUserName()+ "님의 회원정보가 정상적으로 변경되었습니다.<br>");
		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
		
		model.addAttribute("title", "회원 정보 수정");
		model.addAttribute("message", sb.toString());*/
		return ".staff.complete";
	}

	@RequestMapping(value="/staff/staffIdCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(
			@RequestParam String staffId
			) throws Exception {
		
		String p="true";
		Staff dto=service.loginStaff(staffId);
		if(dto!=null)
			p="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("passed", p);
		return model;
	}
}
