package com.mystudy.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

// 회원 등록 또는 회원가입
public class CreateMemberCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 한글 깨짐 처리
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		
		String        id = request.getParameter("id").trim();
		String password1 = request.getParameter("password1").trim();
		String password2 = request.getParameter("password2").trim();
		String 	    name = request.getParameter("name").trim();
		String 	   phone = request.getParameter("phone").trim();
		String     email = request.getParameter("email").trim();
		String   address = request.getParameter("address").trim();
		String  address2 = request.getParameter("address2").trim();
		
		// -------------------------------------
		// 주소 합치기
		// 주소 = ~시 ~구 상세주소
		address = address + " " + address2;
		
		// 수정할 값 넣은 객체
		MemberVO vo = new MemberVO(
				id,
				password1,
				name,
				phone,
				email,
				address
				);
		
		int result = MemberDAO.createMember(vo);
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		// 회원가입 성공
		if (result != -1) {
			if (loginUser != null &&
				"admin".equals(loginUser.getId())) {
				
				request.setAttribute("createSuccess", true);
				request.setAttribute("msg", "회원 등록 완료됐습니다.");
				return "controller?type=manageMembersPage";	
			}
			else {
				request.setAttribute("createSuccess", true);
				request.setAttribute("msg", "회원가입 되었습니다. 로그인 화면으로 이동합니다.");
				return "member/login.jsp";
			}
		}
		// ----------------------------------
		// (사용자) 회원가입 실패 - 회원가입 페이지로
		// (관리자) 회원등록 실패 - 회원관리 페이지로
		else {
			
			request.setAttribute("createSuccess", false);
			request.setAttribute("msg", "회원 등록 실패!");
			if (loginUser != null && "admin".equals(((MemberVO) request.getSession().getAttribute("loginUser")).getId())) {
				return "controller?type=manageMembersPage";
			}
			return "member/login.jsp";
		}
	}
}
