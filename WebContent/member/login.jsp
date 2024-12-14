<%@page import="com.mystudy.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${loginUser == null and loginSuccess == false}">
	<script>
		alert("${msg}");
		location.href = "controller?type=login";
	</script>
</c:if>
<c:if test="${isExistId != null}">
	<script>
		alert("${msg}");
		location.href = "controller?type=login";
	</script>
</c:if>	
<c:if test="${isExistPwd != null}">
	<script>
		alert("${msg}");
		location.href = "controller?type=login";
	</script>
</c:if>	
<c:if test="${isDelete != null}">
	<script>
		alert("${msg}");
		location.href = "controller?type=login";
	</script>
</c:if>	
<%-- 회원가입 성공시 메시지 표시 --%>
<c:if test="${createSuccess != null}">
	<script>
		alert("${msg}");
		location.href = "controller?type=login";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
	input {
		height: 50px;
		font-size: 15px;
	}
	.pinkBtn {
		font-weight: bold;
		color: white;
		background-color: DarkSalmon;
		border: 0;
		border-radius: 5px;
	}
	.whiteBtn {
		font-weight: bold;
		color: DarkSalmon;
		background-color: white;
		border: 2px solid DarkSalmon;
		border-radius: 5px;
	}
	.aTag {
		font-size: 16px;
		text-decoration: none;
		color: black;
	}
</style>
<style>
 	
<%@ include file="../img/footerStyle.jspf" %>
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>

<div class="container mt-4" style="width:300px">
	<div class="mb-4 text-center">
		<h4><strong>로그인</strong></h4>
	</div>
	<div>
		<form method="post">
			<div>
				<input class="mb-2 w-100" type="text" name="id" placeholder=" 아이디를 입력해주세요.">
				<input class="mb-4 w-100" type="password" name="password" placeholder=" 비밀번호를 입력해주세요.">
			</div>
			<div class="mb-4 float-right aTag">
				<a href="#" style="text-decoration: none; font-size: 16px; color: black;" onclick="location.href = 'controller?type=findIdPage';">아이디 찾기</a> | 
				<a href="#" style="text-decoration: none; font-size: 16px; color: black;" onclick="location.href = 'controller?type=findPasswordPage';">비밀번호 찾기</a>
			</div>
			
			<input class="pinkBtn mb-2 w-100" type="button" value="로그인"  onclick="loginCheck(this.form)">
			<input class="whiteBtn mb-3 w-100" type="button" value="회원가입" onclick="location.href = 'controller?type=createMemberPage';">
			<input type="hidden" name="type" value="login">
		</form>
	</div>
</div>	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>	
<script>
	// 로그인 입력 검증
	function loginCheck(frm) {
		// 아이디 입력 안 함
		if (frm.id.value.trim() == "") {
			alert("아이디를 입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return ;
		}
		// -------------------------------------
		// 비밀번호 입력 안 함
		if (frm.password.value.trim() == "") {
			alert("비밀번호를 입력하세요.");
			frm.password.value = "";
			frm.password.focus();
			return ;
		}
		frm.action = "controller";
		frm.submit();
	}
	
	// 새로고침시 
	window.onkeydown = function() {
		var kcode = event.keyCode;
		
		if(kcode == 116)
			location.href = "controller?type=login";
	}
</script>
<br><br><br>
</body>
<%@ include file="../img/footer.jspf" %>
</html>