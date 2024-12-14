<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mystudy.model.dao.QADAO" %>
<%@ page import="com.mystudy.model.vo.QAVO" %>
<%
    String memid = "admin";
    String content = request.getParameter("answer"); // 답변 내용
    int parentId = Integer.parseInt(request.getParameter("qaId"));
    String productCode = request.getParameter("productCode");
    String category = request.getParameter("category");

    // QAVO 객체 생성 및 속성 설정
    QAVO answer = new QAVO();
    answer.setCategory(category);
    answer.setTitle("관리자답변");
    answer.setMemid(memid);
    answer.setContent(content);
    answer.setParentQaId(parentId);
    answer.setProductCode(productCode);

    System.out.println(memid);
    System.out.println(content);
    System.out.println(parentId);
    System.out.println(productCode);
    System.out.println(category);

    // 데이터베이스에 답변 저장
    QADAO dao = new QADAO();
    int result = dao.insertAnswer(answer);

    // 적절한 응답을 보여줄 부분 (예: 성공 또는 실패 메시지)
    if (result > 0) {
        System.out.println("답변이 성공적으로 저장되었습니다.");
    } else {
        out.println("답변 저장에 실패했습니다.");
    }
%>

