package com.mystudy.command.cart;

import com.mystudy.command.Command;
import com.mystudy.model.dao.CartDAO;
import com.mystudy.model.vo.CartVO;
import com.mystudy.model.vo.MemberVO;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CartInsertCommand implements Command {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 사용자로부터 폼 데이터를 받아와서 QAVO 객체에 설정
        String memid = ((MemberVO) (request.getSession().getAttribute("loginUser"))).getId();
        String productCode = request.getParameter("productCode");
        int cnt = Integer.parseInt(request.getParameter("cnt"));
        
        // 2. QAVO 객체를 생성하고 데이터 설정
        CartVO vo = new CartVO();
        vo.setMemid(memid);
        vo.setProductCode(productCode);
        vo.setCnt(cnt);

        // 3. QADAO를 사용하여 데이터베이스에 등록
        CartDAO dao = new CartDAO();
        int result = dao.insertCartItem(vo);
        
        List<CartVO> list = CartDAO.selectCartList(memid);
    	
    	//2. 응답페이지(list.jsp)에 전달
    	request.setAttribute("CartList", list);


        if (result > 0) {
            return "cart/CartList.jsp";
        } else {
            return "ErrorPage.jsp";
        }
    }
}

