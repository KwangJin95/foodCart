package com.mystudy.command.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ReviewDAO;
import com.mystudy.model.vo.ReviewVO;

public class ReviewUpdateCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String content = request.getParameter("content");
	    int record = Integer.parseInt(request.getParameter("record"));	    
	    String reviewNumStr = request.getParameter("reviewNum");
	    String id = request.getParameter("id");
	    String productCode = request.getParameter("productCode");
	   
	    int reviewNum = 0; // 기본값 설정

	    if (reviewNumStr != null && !reviewNumStr.isEmpty()) {
	        reviewNum = Integer.parseInt(reviewNumStr);
	    }
	    
	    ReviewVO review = new ReviewVO();
	    
	    review.setContent(content);
	    review.setRecord(record);
	    review.setReviewNum(reviewNum);
	    review.setId(id);
	    review.setProductCode(productCode);
	    
	    System.out.println(reviewNum);
	    System.out.println(content);
	    System.out.println(record);
	    
	    int result = ReviewDAO.updateReview(review);
	    if(result == 1) {
	    	System.out.println("입력 성공");
	    } else {
	    	System.out.println("입력 실패");
	    }
	    
		request.setAttribute("review", review);
		request.setAttribute("productCode", productCode);
		//request.getRequestDispatcher("controller?type=reviewList").forward(request, response);
		return "controller?type=reviewList&productCode=";		
	}		
	
}
	


