<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<jsp:include page="myPageHeader.jsp"/>
	
</body>
<script>
// F5 누르면 index.jsp 재요청 
	window.onkeydown = function() {
		var kcode = event.keyCode;
		
		if(kcode == 116)
			location.href = "controller?type=myPage";
	}
</script>
</html>