package com.mystudy.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

public class UpdateMemberPageCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id").trim();
		
		MemberVO updateVO = MemberDAO.isExistById(id);
		
		request.setAttribute("updateVO", updateVO);
				
		return "member/updateMemberPage.jsp";
	}
}
