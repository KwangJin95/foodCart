package com.mystudy.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.command.Command;

public class LogoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션 초기화
		HttpSession session = request.getSession();
		
		session.removeAttribute("loginUser");
		
		session.invalidate();
		
		// 세션 재할당
		request.getSession();
		
		// 로그아웃 성공
		request.setAttribute("logoutSuccess", true);
		
		// 메인 페이지로 이동
		return "index.jsp";	
	}
}
