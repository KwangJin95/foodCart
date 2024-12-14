package com.mystudy.command.category;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.ProductVO;

public class SearchNameCommand implements Command {
		@Override
		public String exec(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			List<ProductVO> productList = ProductDAO.getProductList(request.getParameter("productName"));
			int nameCount = ProductDAO.nameCount(request.getParameter("productName"));
			request.setCharacterEncoding("UTF-8");   
			request.setAttribute("nameCount", nameCount);
			request.setAttribute("productList", productList);
		        
			return "SearchNameSuccess.jsp";
		}
}
