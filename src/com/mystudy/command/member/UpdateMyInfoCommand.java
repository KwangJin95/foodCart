package com.mystudy.command.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.vo.MemberVO;

public class UpdateMyInfoCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8");
		
		String        id = request.getParameter("id").trim();
		String password1 = request.getParameter("password1").trim();
		String password2 = request.getParameter("password2").trim();
		String 	    name = request.getParameter("name").trim();
		String 	   phone = request.getParameter("phone").trim();
		String     email = request.getParameter("email").trim();
		String   address = request.getParameter("address").trim();
		String  address2 = request.getParameter("address2").trim();
		
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
		
		int result = MemberDAO.updateMyInfo(vo);

		// 수정 성공
		if (result != -1) {
			request.setAttribute("updateSuccess", true);
			request.setAttribute("msg", "회원정보 수정 완료했습니다. 다시 로그인 해주세요.");
			
			// 로그아웃 후 메인 페이지로
			return "controller?type=logout";
		}
		
		// 수정 실패 - 수정페이지로
		request.setAttribute("updateSuccess", false);
		request.setAttribute("msg", "수정 실패!");
		return "member/updateMyInfoPage";
	}
	
}
