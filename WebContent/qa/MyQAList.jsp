<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Q&A게시판</title>
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
            text-align: left;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td  {
            text-align: left;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        thead {
            background-color: DarkSalmon;
            color: #fff;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #ddd;
        }

        tfoot button{
            background-color: DarkSalmon;
        }

        #insertQA {
            margin: 20px auto;
            display: block;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        .paging {
            list-style: none;
            padding: 0;
            text-align: center;
            margin-top: 10px;
        }

        .paging li {
            display: inline-block;
            margin: 0 5px;
        }

        .paging a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #333;
            color: #fff;
            border-radius: 5px;
        }

        .paging .now {
            background-color: #f5f5f5;
            color: #333;
        }
        <jsp:include page="../img/footerStyle.jspf"/>
    </style>

</head>
<body>
    <jsp:include page="../myPageHeader.jsp"/>
<h1>내 문의함</h1>
<table>
    <thead>
    <tr>
        <th>게시글 ID</th>
        <th>제목</th>
        <th>등록일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="qa" items="${list}">
        <tr>
            <td>${qa.qaId}</td>
            <td><a href="qa?type=QADetail&qaId=${qa.qaId}">${qa.title}</a></td>
            <td>
                <fmt:formatDate value="${qa.rDate}" pattern="yyyy/MM/dd" var="formattedDate" />
                    ${formattedDate}
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="3" style="text-align: center;">
            <input type="submit" value="글작성" id="insertQA" onclick="location.href='qa?type=QAWrite';">
        </td>
    </tr>
    </tfoot>
</table>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

</body>
<%@ include file="../img/footer.jspf" %>
</html>
