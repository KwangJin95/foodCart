package com.mystudy.command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

@WebServlet("/PasswordCheck")
public class GetJsonPasswordCheckControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("application/json; charset=UTF-8");
						
		PrintWriter out = response.getWriter();
		
		// 로그인한 회원 객체 세션에서 가져옴
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		
		// 입력 받은 비밀번호
		String password = request.getParameter("password");
		
		// 비밀번호 맞게 입력함
		if (loginUser.getPassword().equals(password)) {
			out.print("{\"isEqual\" : " + true + "}");
		}
		else {
			out.print("{\"isEqual\" : " + false + "}");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
