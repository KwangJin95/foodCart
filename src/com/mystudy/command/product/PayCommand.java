package com.mystudy.command.product;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.MemberVO;
import com.mystudy.model.vo.ProductVO;

public class PayCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kind = request.getParameter("kind");
        String selectedMethod = request.getParameter("selectedMethod");
        int total = Integer.parseInt(request.getParameter("total"));
        String[] productCodes = request.getParameterValues("productCodes");
        String[] saleCounts = request.getParameterValues("saleCounts");
        String id = request.getParameter("id");
        String productCode;
        String name;
        String productNames = "";
        System.out.println(productCodes[0]);
        System.out.println(productCodes.length);
        
        if (productCodes != null && saleCounts != null) {
        	for (int i = 0; i < productCodes.length; i++) {
        		productCode = productCodes[i];
        		ProductVO vo = ProductDAO.selectOne(productCode);
        		String productName = vo.getProductName();
        		
        		if (i > 0) {
        			productNames += ", ";
        			productCodes[i] += ", ";
        		}
        		productNames += productName;
        	}
        }
        // 가상계좌 번호 생성 (여기서는 12자리의 랜덤 숫자 생성)
        String virtualAccountNumber = String.valueOf((long)(Math.random() * 9_000_000_000L) + 1_000_000_000L);

        // 회원 이름 추출
        MemberVO mvo = MemberDAO.isExistById(id);
        name = mvo.getName();

        // 가상계좌 번호를 JSP 페이지로 전달
        request.setAttribute("virtualAccountNumber", virtualAccountNumber);
        request.setAttribute("kind", kind);
        request.setAttribute("selectedMethod", selectedMethod);
        request.setAttribute("total", total);
        request.setAttribute("productCodes", productCodes);
        request.setAttribute("saleCounts", saleCounts);
        request.setAttribute("purchaseName", name);
        request.setAttribute("productNames", productNames);

        
		return "product/purchaseCommit.jsp";
	}
}
