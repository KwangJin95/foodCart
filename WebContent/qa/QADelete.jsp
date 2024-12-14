<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mystudy.model.dao.QADAO" %>
<%
  try {
    int qaId = Integer.parseInt(request.getParameter("qaId"));

    QADAO.deleteQA(qaId);

  } catch (NumberFormatException e) {
    out.println("유효하지 않은 데이터입니다.");
  }
%>