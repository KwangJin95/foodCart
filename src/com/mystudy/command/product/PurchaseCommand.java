package com.mystudy.command.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;
import com.mystudy.model.dao.CartDAO;
import com.mystudy.model.dao.MemberDAO;
import com.mystudy.model.dao.ProductDAO;
import com.mystudy.model.vo.CartVO;
import com.mystudy.model.vo.MemberVO;
import com.mystudy.model.vo.ProductVO;

public class PurchaseCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String[] stringCartId = request.getParameterValues("selectedcartIds");
        String[] productCodes = request.getParameterValues("productCode");
        String[] cnts = request.getParameterValues("cnt");
        MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
        
        if (loginUser == null) 
        	return "member/login.jsp"; 
        
        String id = loginUser.getId();
        int total = 0;
        int saleCount = 0;
        
        if (stringCartId != null) {
        	//장바구니 존재
        	productCodes = new String[stringCartId.length-1];
        	for (int i = 0; i < stringCartId.length; i++) {
        		int cartId = Integer.parseInt(stringCartId[i]);
        		CartVO cvo = CartDAO.selectOne(cartId);
        		ProductVO vo = ProductDAO.selectOne(cvo.getProductCode());
        		productCodes[i] = cvo.getProductCode();
        		id = cvo.getMemid();
        		saleCount = cvo.getCnt();
        		int sum = vo.getPrice() * saleCount;
        
        		total += sum;// total에 sum을 누적
        	}
        } else {
        	//바로 구매
        	ProductVO vo = ProductDAO.selectOne(productCodes[0]);
        	total = Integer.parseInt(cnts[0]) * vo.getPrice();
        }
        // 회원정보 출력
        MemberVO mvo = MemberDAO.isExistById(id);
        
        
        
        request.setAttribute("productCodes", productCodes);
        request.setAttribute("cnts", cnts);
        request.setAttribute("id", id);
        request.setAttribute("mvo", mvo);
        request.setAttribute("total", total);
		
		return "product/purchase.jsp";
	}
}
