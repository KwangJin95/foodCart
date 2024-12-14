package com.mystudy.command.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ReviewDAO;
import com.mystudy.model.vo.ReviewVO;


public class ReviewDeleteCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		int result = ReviewDAO.deleteReview(reviewNum);				
	
		if (result == 1) {
	        System.out.println("리뷰 삭제 성공!!!!!!!!!!!!!");
	    } else {
	        System.out.println("리뷰 삭제 실패ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");
	    }
		request.getRequestDispatcher("controller?type=reviewList").forward(request, response);
		return "ReviewView.jsp";
				
		
		
	}

}
