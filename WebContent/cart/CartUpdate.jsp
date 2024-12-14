<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mystudy.model.dao.CartDAO" %>
<%@ page import="com.mystudy.model.vo.CartVO" %>
<%
    try {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int change = Integer.parseInt(request.getParameter("change"));

        // 해당 cartNum에 대한 수량 업데이트
        CartVO cartItem = CartDAO.selectOne(cartId);
        int newQuantity = cartItem.getCnt() + change;

        out.print(cartItem.getCnt());
        out.print(change);
        out.print(newQuantity);

        cartItem.setCnt(newQuantity);
        CartDAO.updateQuantity(cartId, newQuantity);

    } catch (NumberFormatException e) {
        out.println("유효하지 않은 데이터입니다.");
    }
%>
