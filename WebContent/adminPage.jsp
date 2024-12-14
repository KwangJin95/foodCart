<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 주문번호 생성 만들기(AutoUpdateCommand.java), 
	주문정보 리스트 만들기(orderList.jsp) --%>
<%
	String imgName = "200000001";
	request.setAttribute("imgName", imgName);

	String id = "PROJECT";
	String password = "1234";
	
	session.setAttribute("id", id);
	session.setAttribute("password", password);
%>

<c:if test="${loginUser == null}">
	<c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>관리자 페이지</title>
<style>
	.container {
		width: 100%;
		margin-left: 20px;
	}
	#line {
		height: 3px;
		border-bottom: 2px solid gray;
	}
	.pinkBtn {
		width: 150px;
		height: 50px;
		font-weight: bold;
		color: white;
		background-color: Tomato;
		border: 0;
		border-radius: 5px;
	}
	.whiteBtn {
		width: 150px;
		height: 50px;
		font-weight: bold;
		color: Tomato;
		background-color: white;
		border: 2px solid Tomato;
		border-radius: 5px;
	}
	.container table {
		width: 100%;
		border-collapse: collapse;
		font-size: 14px;
	}
	.container th {
		border: 1px solid black;
		padding: 1px 10px;
		background-color: Gainsboro;
		text-align: center;
	}
	.container td {
		border: 1px solid black;
		padding: 1px 10px;
	}

	span {
		display: inline-block;
	}
	.smallWhiteBtn {
		text-decoration: none;
		border: 2px solid Tomato;
		color: Tomato;
		font-weight: bold;
		border-radius: 5px;
	}
	.smallPinkBtn {
		text-decoration: none;
		border: 0;
		color: white;
		background-color: Tomato;
		font-weight: bold;
		border-radius: 5px;
	}
	#keyword {
		width: 250px;
	}
	#menu {
		width: 80px;
	}
</style>
</head>
<body>
<jsp:include page="adminPageHeader.jsp"/>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script>
// F5 누르면 index.jsp 재요청 
	window.onkeydown = function() {
		var kcode = event.keyCode;
		
		if(kcode == 116)
			location.href = "controller?type=adminPage";
	}
</script>	
</body>
</html>