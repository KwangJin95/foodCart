package com.mystudy.command.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.ProductVO;

public class SaleListCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int categoryCode = Integer.parseInt(request.getParameter("categoryCode"));
		
		List<ProductVO> list = ProductDAO.categorySaleNum(categoryCode);
		
		request.setAttribute("listCategory",list);
		
		return "productListMain.jsp";
	}
}
