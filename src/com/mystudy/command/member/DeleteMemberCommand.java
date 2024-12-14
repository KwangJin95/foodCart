package com.mystudy.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;

public class DeleteMemberCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 삭제할 id 값
		String id = request.getParameter("id");
		
		int result = 0;
		
		result = MemberDAO.deleteOne(id);

		// 회원 삭제 성공
		if (result > 0) {
			request.setAttribute("deleteSuccess", true);
			request.setAttribute("msg", "회원 삭제 성공했습니다.");
		}
		// 회원 삭제 실패
		else {
			request.setAttribute("deleteSuccess", false);
			request.setAttribute("msg", "해당 ID의 회원이 없거나 삭제 실패!");
		}

		// 회원관리 페이지로 이동
		return "controller?type=manageMembersPage";
	}
}
