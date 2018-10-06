package com.sp.staff;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

// 로그인 성공 후 세션 및 쿠키 등의 처리(인증 성공 후 정보 저장) => spring security에서 인증해줬으므로 security에서 정보를 가져오면 됨
// 스마트폰의 경우 로그인 정보를 쿠키에 저장한다.
public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	@Autowired
	private StaffService service;

	// authentication : 로그인한 정보를 가지고 있는 객체
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		String userId = authentication.getName();

		// 세션에 로그인 정보 저장
		HttpSession session = request.getSession();
		Staff dto = service.readStaffById(userId);
		SessionInfo info = new SessionInfo();
		info.setStaffIdx(dto.getUsersCode());
		info.setStaffId(userId);
		info.setStaffName(dto.getName());
	
		// session에 member라는 이름으로 사용자 정보 저장
		session.setAttribute("staff", info);

		super.onAuthenticationSuccess(request, response, authentication);
	}

}
