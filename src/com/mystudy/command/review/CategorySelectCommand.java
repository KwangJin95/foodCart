package com.mystudy.command.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.CategoryDAO;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.CategoryVO;

import com.mystudy.model.vo.ProductVO;

public class CategorySelectCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoryCode = Integer.parseInt(request.getParameter("categoryCode"));
		List<ProductVO> productList = ProductDAO.getProductList(categoryCode);
		
		List<CategoryVO> categoryList = CategoryDAO.getCategoryName(categoryCode);
			
		
		request.setAttribute("productList", productList);
		request.setAttribute("categoryList", categoryList);
//		request.getRequestDispatcher("categorySelectSuccess.jsp").forward(request, response);
		
		return "categorySelectSuccess.jsp";
			
	}

}
