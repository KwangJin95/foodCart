<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mystudy.model.dao.QADAO" %>
<%
  try {
    int anserId = Integer.parseInt(request.getParameter("parentQaId"));

    QADAO.deleteAnswer(anserId);

  } catch (NumberFormatException e) {
    out.println("유효하지 않은 데이터입니다.");
  }
%>