package com.mystudy.command.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;

public class FindPasswordCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String      id = request.getParameter("id").trim();
		String   phone = request.getParameter("phone").trim();
		String   email = request.getParameter("email").trim();
		String address = request.getParameter("address").trim();
		String address2 = request.getParameter("address2").trim();
		
		// 주소 합치기
		address += " " + address2;
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("phone", phone);
		map.put("email", email);
		map.put("address", address);
		
		String result = MemberDAO.findPassword(map);
		
		request.removeAttribute("isExist");

		if (result == null) {
			request.setAttribute("isExistPwd", false);
			request.setAttribute("msg", "입력한 정보에 해당하는 아이디가 존재하지 않아 비밀번호를 찾을 수 없습니다.");
			
		} 
		else {
			request.setAttribute("isExistPwd", true);
			request.setAttribute("msg", id + " 님의 비밀번호는 < " + result + " > 입니다. "
					+ "로그인 화면으로 이동합니다.");
		}
		
		return "member/login.jsp";
	}
}
