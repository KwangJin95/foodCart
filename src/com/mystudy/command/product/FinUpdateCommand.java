package com.mystudy.command.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.ProductVO;

public class FinUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kind = request.getParameter("kind");
		System.out.println(kind);
		
		String productCode = request.getParameter("productCode");

		String useYn = null;
		String productName = null;
		String detail;
		int price = 0;
		int result = 0;
		int stock = 0;

		ProductVO pvo = new ProductVO();
		
		if ("all".equals(kind)) {
			productName = request.getParameter("productName");
			price = Integer.parseInt(request.getParameter("price")); 
			detail = request.getParameter("detail"); 
			
			if (productName != "" && price != 0) {
				
				pvo.setProductCode(productCode); 
				pvo.setProductName(productName);
				pvo.setPrice(price); 
				pvo.setDetail(detail);
				
				result = ProductDAO.setUpdateAll(pvo);
				request.setAttribute("result", result);
			}
		} else if ("stock".equals(kind)) {
			stock = Integer.parseInt(request.getParameter("stock")); 
			useYn = request.getParameter("useYn");
			
			if (stock != 0 && useYn != "") {
				pvo.setProductCode(productCode);
				pvo.setStock(stock);
				pvo.setUseYn(useYn);
				
				result = ProductDAO.setUpdateStock(pvo);
				request.setAttribute("result", result);
			}
			
		}
		
		
		return "product/result.jsp";
	}
}
