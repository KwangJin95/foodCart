<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Q&A</title>
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
            background-color: #ffffff;
            color: #fff;
            padding: 20px;
            text-align: center;
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
            background-color: DarkSalmon;
            color: #fff;
            border-radius: 5px;
        }

        .paging .now {
            background-color: #f5f5f5;
            color: #ff834d;
        }
        <jsp:include page="../img/footerStyle.jspf"/>
    </style>
    <script>
        function goToPage(pageNumber) {
            // 페이지 이동 로직을 처리하는 코드를 추가
            // 예를 들어, 페이지 이동 URL을 생성하고 window.location.href로 이동할 수 있습니다.
        }
    </script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h1>Q&A 게시판</h1>
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
            <td><a href="qa?type=AdminQADetail&qaId=${qa.qaId}">${qa.title}</a></td>
            <td>
                <fmt:formatDate value="${qa.rDate}" pattern="yyyy/MM/dd" var="formattedDate" />
                    ${formattedDate}
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="3">
            <ol class="paging">
                <c:choose>
                    <c:when test="${pvo.nowPage == 1 }">
                        <li class="disable">이전으로</li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="qa?type=QAList&cPage=${pvo.nowPage - 1 }">이전으로</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
                    <c:choose>
                        <c:when test="${pageNo == pvo.nowPage }">
                            <li class="now">${pageNo }</li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="qa?type=QAList&cPage=${pageNo }">${pageNo }</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${pvo.nowPage >= pvo.totalPage }">
                        <li class="disable">다음으로</li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="qa?type=QAList&cPage=${pvo.nowPage + 1 }">다음으로</a>
                        </li>
                        <!-- 1페이지에서 다음으로 버튼 사라지는 오류 해결 해야함-->
                    </c:otherwise>
                </c:choose>
            </ol>
        </td>
    </tr>
    <tr>
<%--        <td colspan="3" style="text-align: center;">--%>
<%--            <input type="submit" value="글작성" id="insertAnswer" onclick="location.href='qa/AnswerInsert.jsp';">--%>
<%--        </td>--%>
    </tr>
    </tfoot>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

</body>
<%@ include file ="../img/footer.jspf" %>
</html>
