package com.mystudy.command.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;

public class FindIdCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name").trim();
		String phone = request.getParameter("phone").trim();
		String email = request.getParameter("email").trim();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("name", name);
		map.put("phone", phone);
		map.put("email", email);
		
		String result = MemberDAO.findId(map);
		
		request.removeAttribute("isExistId");
		
		if (result == null) {
			request.setAttribute("isExistId", false);
			request.setAttribute("msg", "입력한 정보의 아이디가 존재하지 않습니다.");
		} 
		else {
			request.setAttribute("isExistId", true);
			request.setAttribute("msg", "찾은 아이디는 < " + result + " > 입니다." + 
										" 로그인 화면으로 이동합니다.");
		}
		return "member/login.jsp";
		
	}
	
}
