<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Food Cart</title>
    <style>
        body {
            font-family: "Inter", sans-serif;
        }
        .header {
            text-align: center;
            background-color: #fff;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            padding: 20px;
        }
        .logo {
            color: #000;
            font-size: 35px;
            font-weight: 400;
            font-style: normal;
            text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            cursor: pointer;
        }
        .menu {
            text-align: center;
            margin-top: 20px;
        }
        .menu-item {
            display: inline-block;
            margin: 0 20px;
            font-size: 14px;
        }
        .menu-item a {
            color: #000; /* 링크의 텍스트 색을 검은색으로 설정 */
            text-decoration: none; /* 링크의 밑줄 제거 */
        }
    </style>
</head>
<body>
<div class="header">
    <div class="logo">Food Cart</div>
    <div class="menu">
        <div class="menu-item"><a href="main.html">카테고리</a></div>
        <div class="menu-item"><a href="menu.html">장바구니</a></div>
        <div class="menu-item"><a href="about.html">마이페이지</a></div>
        <div class="menu-item"><a href="contact.html">문의</a></div>
    </div>
</div>
</body>
</html>



