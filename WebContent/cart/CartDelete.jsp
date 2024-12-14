<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mystudy.model.dao.CartDAO" %>
<%
    try {
        int cartId = Integer.parseInt(request.getParameter("cartId"));

        out.print(cartId);

        int result = CartDAO.deleteCartItem(cartId);

//        if (result > 0) {
//            out.println("수량 업데이트가 성공했습니다.");
//        } else {
//            out.println("수량 업데이트에 실패했습니다.");
//        }
    } catch (NumberFormatException e) {
        out.println("유효하지 않은 데이터입니다.");
    }
%>
