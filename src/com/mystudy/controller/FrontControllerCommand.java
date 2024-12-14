package com.mystudy.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.AdminPageCommand;
import com.mystudy.command.Command;
import com.mystudy.command.MyPageCommand;
import com.mystudy.command.category.CategorySelectCommand;
import com.mystudy.command.category.SearchNameCommand;
import com.mystudy.command.member.CreateMemberCommand;
import com.mystudy.command.member.CreateMemberPageCommand;
import com.mystudy.command.member.DeleteMemberCommand;
import com.mystudy.command.member.DeleteMemberPageCommand;
import com.mystudy.command.member.DeleteMyInfoCommand;
import com.mystudy.command.member.DeleteMyInfoPageCommand;
import com.mystudy.command.member.FindIdCommand;
import com.mystudy.command.member.FindIdPageCommand;
import com.mystudy.command.member.FindPasswordCommand;
import com.mystudy.command.member.FindPasswordPageCommand;
import com.mystudy.command.member.LoginCommand;
import com.mystudy.command.member.LogoutCommand;
import com.mystudy.command.member.ManageMembersPageCommand;
import com.mystudy.command.member.SelectMyInfoCommand;
import com.mystudy.command.member.UpdateMemberCommand;
import com.mystudy.command.member.UpdateMemberPageCommand;
import com.mystudy.command.member.UpdateMyInfoCommand;
import com.mystudy.command.member.UpdateMyInfoPageCommand;
import com.mystudy.command.order.OrderCommand;
import com.mystudy.command.product.AutoUpdateCommand;
import com.mystudy.command.product.DetailCommand;
import com.mystudy.command.product.FinResistCommand;
import com.mystudy.command.product.FinUpdateCommand;
import com.mystudy.command.product.MainCommand;
import com.mystudy.command.product.PayCommand;
import com.mystudy.command.product.ProductRegistCommand;
import com.mystudy.command.product.ProductUpCommand;
import com.mystudy.command.product.PurchaseCommand;
import com.mystudy.command.review.ReviewDeleteCommand;
import com.mystudy.command.review.ReviewInsertCommand;
import com.mystudy.command.review.ReviewListCommand;
import com.mystudy.command.review.ReviewUpdateCommand;

@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행----");
		
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		
		Command command = null;
		
		// --------------------- 로그인 -----------------------
		// 로그인
		if ("login".equals(type)) {
			command = new LoginCommand();
		}
		// 회원가입 페이지
		if ("createMemberPage".equals(type)) {
			command = new CreateMemberPageCommand();
		}
		// 회원가입 가입하기
		if ("createMember".equals(type)) {
			command = new CreateMemberCommand();
		}
		// 아이디 찾기 페이지
		if ("findIdPage".equals(type)) {
			command = new FindIdPageCommand();
		}
		// 아이디 찾기
		if ("findId".equals(type)) {
			command = new FindIdCommand();
		}
		// 비밀번호 찾기 페이지
		if ("findPasswordPage".equals(type)) {
			command = new FindPasswordPageCommand();
		}
		// 비밀번호 찾기
		if ("findPassword".equals(type)) {
			command = new FindPasswordCommand();
		}
		// 로그아웃
		if ("logout".equals(type)) {
			command = new LogoutCommand();
		}
		// ------------------- 관리자 --------------------------
		// 관리자 페이지로 이동
		if ("adminPage".equals(type)) {
			command = new AdminPageCommand();
		}
		// 회원관리(조회, 수정, 삭제) 페이지
		if ("manageMembersPage".equals(type)) {
			command = new ManageMembersPageCommand();
		}
		// 회원정보 수정 페이지
		if ("updateMemberPage".equals(type)) {
			command = new UpdateMemberPageCommand();
		}
		// 회원정보 수정
		if ("updateMember".equals(type)) {
			command = new UpdateMemberCommand();
		}
		// 회원정보 삭제 페이지
		if ("deleteMemberPage".equals(type)) {
			command = new DeleteMemberPageCommand();
		}
		// 회원정보 삭제
		if ("deleteMember".equals(type)) {
			command = new DeleteMemberCommand();
		}
		
		// ------------------- 회원 --------------------------
		// 회원 마이페이지
		if ("myPage".equals(type)) {
			command = new MyPageCommand();
		}
		// 회원 본인 정보 조회
		if ("selectMyInfo".equals(type)) {
			command = new SelectMyInfoCommand();
		}
		// 회원 본인 정보 수정 입력페이지
		if ("updateMyInfoPage".equals(type)) {
			command = new UpdateMyInfoPageCommand();
		}
		// 회원 본인 정보 수정
		if ("updateMyInfo".equals(type)) {
			command = new UpdateMyInfoCommand();
		}
		// 탈퇴하기 페이지
		if ("deleteMyInfoPage".equals(type)) {
			command = new DeleteMyInfoPageCommand();
		}
		// 탈퇴하기
		if ("deleteMyInfo".equals(type)) {
			command = new DeleteMyInfoCommand();
		}
		
		// 상품 
		// ----------------------------------------------------------
		if ("main".equals(type)) {
			command = new MainCommand();
		}
	    if ("productRegist".equals(type)) {
	    	command = new ProductRegistCommand();
	    }
	    if ("productUp".equals(type)){
	        command = new ProductUpCommand();
	    }
	    if ("pay".equals(type)){
	        command = new PayCommand();
	    }
	    if ("purchase".equals(type)){
	    	command = new PurchaseCommand();
	    }
	    if ("detail".equals(type)){
	        command = new DetailCommand();
	    }
	    if ("autoUpdate".equals(type)){
	        command = new AutoUpdateCommand();
	    }
	    if ("finresist".equals(type)){
			command = new FinResistCommand();
		} 
	    if ("finupdate".equals(type)){
	        command = new FinUpdateCommand();
	    } 
	    if ("order".equals(type)){
	    	command = new OrderCommand();
	    }
		// -----------------------------------------------------
	    // 카테고리, 리뷰
	    if("categorySearch".equals(type)) {
			command = new CategorySelectCommand();
		} 
	    if("delete".equals(type)) {
			command = new ReviewDeleteCommand();
		} 
	    if("insert".equals(type)) {
			command = new ReviewInsertCommand();
		} 
	    if("reviewList".equals(type)) {
			command = new ReviewListCommand();
		} 
	    if ("update".equals(type)) {
			command = new ReviewUpdateCommand();
		} 
	    if("search".equals(type)) {
			command = new SearchNameCommand();
		}
	    if("myReview".equals(type)) {
	    	command = new SearchNameCommand();
	    }	
	    
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행----");

		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
