package com.mystudy.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;

public class DeleteMyInfoCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String id = request.getParameter("id");
		
		int result = MemberDAO.deleteOne(id);
		
		if (result > 0) {
			request.setAttribute("isDelete", true);
			request.setAttribute("msg", "탈퇴하기 성공했습니다. 로그인 화면으로 이동합니다.");
			
			// 세션 초기화
			request.getSession().invalidate();
			// 세션 재할당
			request.getSession();
		}
		else {
			request.setAttribute("isDelete", false);
			request.setAttribute("msg", "탈퇴하기 실패!");
		}
		
		return "member/login.jsp";
	}
}
