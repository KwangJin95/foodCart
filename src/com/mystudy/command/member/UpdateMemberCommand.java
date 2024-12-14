package com.mystudy.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

public class UpdateMemberCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String       id = request.getParameter("id");
		String password = request.getParameter("password");
		String     name = request.getParameter("name");
		String    phone = request.getParameter("phone");
		String    email = request.getParameter("email");
		String  address = request.getParameter("address");
		String  regdate = request.getParameter("regdate");
		
		MemberVO vo = new MemberVO(id, password, name, phone, email, address, regdate);

		System.out.println("updateCommand vo : " + vo);
		
		int result = MemberDAO.updateMember(vo);
		
		if (result > -1) {
			request.setAttribute("updateSuccess", true);
			request.setAttribute("msg", "회원정보 수정 완료됐습니다.");
		}
		
		else {
			request.setAttribute("updateSuccess", false);
			request.setAttribute("msg", "회원정보 수정 실패!");
		}
		
		return "controller?type=manageMembersPage";
	}
}
