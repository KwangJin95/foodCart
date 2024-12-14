package com.mystudy.command.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.ProductVO;


public class DetailCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productCode = request.getParameter("productCode");
		System.out.println(productCode);
		ProductVO vo = ProductDAO.selectOne(productCode);
		if (vo == null) {
			 PrintWriter out = response.getWriter();
			 out.println("<script>");
			 out.println("alert('등록된 상품이 없으므로 먼저 상품을 등록해주세요\n확인버튼을 누를시 등록화면으로 이동됩니다.')");
			 out.println("</script>");
			 return "product/productRegist.jsp"; 
		} else {
			request.setAttribute("vo", vo);
			return "product/productDetail.jsp";
		}
		
	}
}
