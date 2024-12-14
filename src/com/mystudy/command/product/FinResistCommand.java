package com.mystudy.command.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.ProductVO;

public class FinResistCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String productCode = request.getParameter("productCode");
		String productName = request.getParameter("productName");
		String categoryCode = request.getParameter("categoryCode");
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String detail = request.getParameter("detail");
		String useYn = request.getParameter("useYn");
		int result = 0;
		if (productCode != null && productName != null && categoryCode != null && useYn != "" && price != 0) {
			
			ProductVO pvo = new ProductVO();
			
			pvo.setProductCode(productCode);
			pvo.setProductName(productName);
			pvo.setCategoryCode(categoryCode);
			pvo.setPrice(price);
			pvo.setStock(stock);
			pvo.setDetail(detail);
			pvo.setUseYn(useYn);
			
			System.out.println(pvo);
			
			result = ProductDAO.insertProduct(pvo);
			request.setAttribute("result", result);
		}
		
		return "product/result.jsp";
	}
}
