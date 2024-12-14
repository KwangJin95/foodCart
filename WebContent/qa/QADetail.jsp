<%@ page import="com.mystudy.model.dao.QADAO" %>
<%@ page import="com.mystudy.model.vo.QAVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 상세 내용</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
           
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .qa-info {
            margin-bottom: 20px;
        }

        .qa-info h2 {
            margin: 0;
        }

        .qa-info p {
            margin: 0;
        }

        .qa-content {
            margin: 20px 0;
        }

        .qa-actions {
            text-align: center;
        }

        .qa-actions button {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        <jsp:include page="../img/footerStyle.jspf"/>
    </style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h1>질문 상세 내용</h1>
<div class="container" data-qaId="<%=request.getAttribute("qaId")%>">
    <div class="qa-info">
        <h2>제목: <%=request.getAttribute("title")%></h2>
        <p>작성 날짜: <span>${rDate}</span></p>
    </div>
    <div class="qa-content">
        <p><%=request.getAttribute("content")%></p>
    </div>
    <div class="qa-actions">
        <button onclick="location.href='qa?type=QAModify&qaId=<%=request.getAttribute("qaId")%>'">수정</button>
        <button onclick="location.href='qa?type=QADelete&qaId=<%=request.getAttribute("qaId")%>'">삭제</button>
        <button onclick="location.href='qa?type=MyQAList'">목록으로 돌아가기</button>
    </div>
</div>

    <c:choose>
        <c:when test="${not empty answer}">
<div class="container">
    <div id="answers" class="text-box">
            ${answer.content}<br>
    </div>
</div>
        </c:when>
    </c:choose>
</body>
<jsp:include page="../img/footer.jspf"/>
</html>

