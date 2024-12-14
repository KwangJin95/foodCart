package com.mystudy.command.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.ProductVO;

public class ProductUpCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productCode = request.getParameter("productCode");
		String kind = request.getParameter("kind");
		
		if(productCode != null) {
			ProductVO vo = ProductDAO.selectOne(productCode);
			request.setAttribute("vo", vo);
			request.setAttribute("kind", kind);
			
			return "product/productUpdate.jsp";
		
		} else {
			List<ProductVO> list = ProductDAO.getList();
			
			request.setAttribute("list", list);
			
			return "product/productList.jsp";			
		}
	}
}
