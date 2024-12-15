<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>질문 작성</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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

    label, input, textarea {
      display: block;
      margin: 10px 0;
    }

    label {
      font-weight: bold;
    }

    input, textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      background-color: DarkSalmon;
      color: #fff;
      border: none;
      border-radius: 5px;
      padding: 10px 20px;
      cursor: pointer;
    }
    .qa-actions {
      text-align: center;
    }

    .qa-actions button {
      background-color: DarkSalmon;
      color: #fff;
      border: none;
      border-radius: 5px;
      padding: 10px 20px;
      cursor: pointer;
    }
    <jsp:include page="../img/footerStyle.jspf"/>
  </style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h1>질문 작성</h1>
<div class="container">
  <form action="qa?type=QAInsert" method="post">
    <label for="category">카테고리:</label>
    <select id="category" name="category">
      <option value="상품 문의">상품 문의</option>
      <option value="배송 문의">배송 문의</option>
      <option value="환불 문의">환불 문의</option>
      <option value="취소/교환/반품">취소/교환/반품</option>
      <option value="기타">기타</option>
    </select>
    <label for="title">제목:</label>
    <input type="text" id="title" name="title" required>

    <label for="content">내용:</label>
    <textarea id="content" name="content" rows="4" required></textarea>
    <div class="qa-actions">
      <button type="submit">등록</button>
    </div>
  </form>
</div>
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

</body>
<%@ include file="../img/footer.jspf" %>
</html>