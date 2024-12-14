package com.mystudy.command.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ReviewDAO;
import com.mystudy.model.vo.MemberVO;
import com.mystudy.model.vo.ReviewVO;

public class ReviewInsertCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("content");
	    int record = Integer.parseInt(request.getParameter("record"));
	    MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
	    String id = loginUser.getId();
	    String productCode = request.getParameter("productCode");	    
	    ReviewVO review = new ReviewVO();
	    System.out.println(productCode);
	    review.setContent(content);
	    review.setRecord(record);
	    review.setId(id);
	    review.setProductCode(productCode);
	    
	    int result = ReviewDAO.insertReview(review);
	    if(result == 1) {
	    	System.out.println("입력 성공");
	    } else {
	    	System.out.println("입력 실패");
	    }
	    
		request.setAttribute("review", review);
		request.setAttribute("productCode", productCode);
		return "controller?type=detail";
	}
}
