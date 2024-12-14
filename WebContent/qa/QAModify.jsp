<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 수정</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 0;
    }

    h1 {
      background-color: #333;
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

    /* Add custom styles for your form elements here */
    /* For example, you can style input fields, textareas, etc. */
  </style>
</head>
<body>
<h1>게시글 수정</h1>
<div class="container">
  <form action="qa?type=QAUpdate&qaId=<%=request.getAttribute("qaId")%>" method="POST">
    <div class="qa-info">
      <h2>제목: <input type="text" name="title" value="<%=request.getAttribute("title")%>"></h2>
    </div>
    <div class="qa-content">
      <p>내용: <textarea name="content" rows="5" cols="40"><%=request.getAttribute("content")%></textarea></p>
    </div>
    <div class="qa-actions">
      <button>저장</button>
      <button onclick="location.href='qa?type=QADetail&qaId=<%=request.getAttribute("qaId")%>'">취소</button>
    </div>
  </form>
</div>
</body>
</html>
