package com.mystudy.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.vo.MemberVO;

public class MyPageCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO vo = (MemberVO) request.getSession(true).getAttribute("loginUser");
		
		if (vo == null)
			return "member/login.jsp";
		
		return "myPage.jsp";
	}
}
