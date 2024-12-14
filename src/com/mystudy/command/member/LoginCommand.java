package com.mystudy.command.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

public class LoginCommand extends HttpServlet implements Command {
	private static final long serialVersionUID = 1L;

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id       = request.getParameter("id");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		System.out.println("id : " + id + ", password : " + password);

		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		
		MemberVO vo = MemberDAO.login(map);
		
		// 로그인 성공
		if (vo != null) {
			request.setAttribute("loginSuccess", true);	
			session.setAttribute("loginUser", vo);
			return "index.jsp";
		}

		// 첫 로그인
		if (id == null) {
			request.removeAttribute("msg");
			return "member/login.jsp";
		}
		// 로그인 실패
		else { 
			request.setAttribute("loginSuccess", false);	
			request.setAttribute("msg", "잘못된 아이디 또는 비밀번호입니다.");
			return "member/login.jsp";
		}
	}
}
