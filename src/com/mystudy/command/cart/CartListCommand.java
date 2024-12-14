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

public class CartListCommand implements Command {
//    @Override
//    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //1. DB연결하고 데이터 가져오기
//        List<CartVO> list = CartDAO.getCartList();
//
//        //2. 응답페이지(list.jsp)에 전달
//        request.setAttribute("CartList", list);
//        
//        return "cart/CartList.jsp";
//    }
	
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//1. DB연결하고 데이터 가져오기
    	String memid = ((MemberVO) (request.getSession().getAttribute("loginUser"))).getId();
    	List<CartVO> list = CartDAO.selectCartList(memid);
    	
    	//2. 응답페이지(list.jsp)에 전달
    	request.setAttribute("CartList", list);
    	
    	return "cart/CartList.jsp";
    }
}
