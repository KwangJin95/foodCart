<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
        <c:when test="${result == 1}">
            <script>
            	alert("제품 등록이 성공했습니다.\n메인페이지로 이동합니다.");
			</script>
        </c:when>
        <c:otherwise>
        	<script>
            	alert("제품 등록에 실패했습니다.\n'*'표시는 필수입력값 입니다. 다시 확인해주세요.");
            	history.back();
        	</script>
        </c:otherwise>
    </c:choose>
<script>
	location.href="controller?type=main";
</script>
</body>
</html>