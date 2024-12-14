package com.mystudy.command.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

@WebServlet("/EmailCheck")
public class GetJsonEmailCheckControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("application/json; charset=UTF-8");
				
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");

		MemberVO voExist = null;
		voExist = MemberDAO.isExistByEmail(email);
		
		if (voExist != null) {
			out.print("{\"isExistEmail\" : " + true + "}");
		}
		else {
			out.print("{\"isExistEmail\" : " + false + "}");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
