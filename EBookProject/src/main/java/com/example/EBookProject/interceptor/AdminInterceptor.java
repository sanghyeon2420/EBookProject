package com.example.EBookProject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.example.EBookProject.model.dto.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션 객체 생성
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		// 세션 변수 검사
		if (dto.getIsAdmin() != 2) {
			// 세션이 없으면 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "?message=isadmin");
			return false; // 계속 진행하지 않음
		} else {
			return true; // 계속 진행함
		}

	}
}
