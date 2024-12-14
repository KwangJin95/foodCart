<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${loginUser == null}">
	<c:redirect url="index.jsp"/>
</c:if>
<%-- 회원 정보 수정 실패시 메시지 --%>
<c:if test="${updateFault != null && updateFault == true}">
	<script>
		alert("${msg}");
	</script>
	<c:remove var="updateFault"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
	.container {
		width: 630px;
	}
	#line {
		height: 3px;
		border-bottom: 2px solid gray;
	}
	input {
		width: 50%;
		height: 50px;
		font-size: 15px;
	}
	.inputForm {
		width: 470px;
	}
	.pinkBtn {
		font-weight: bold;
		width: 47%;
		color: white;
		background-color: DarkSalmon;
		border: 0;
		border-radius: 5px;
	}
	.whiteBtn {
		font-weight: bold;
		width: 47%;
		color: DarkSalmon;
		background-color: white;
		border: 2px solid DarkSalmon;
		border-radius: 5px;
	}
	#checkIdBtn {
		width: 100px;
	}
	select {
		width: 47%;
	}
	.label {
		height: 50px;
		width: 27%;
		font-weight: bold;
	}
	.input {
		height: 50px;
		width: 71%;
	}
	span {
		display: inline-block;
	}
	.inputName {
		line-height: 50px;
	}

</style>

<title>내 정보 보기</title>
<style>
 	
<%@ include file="../img/footerStyle.jspf" %>
</style>
</head>
<body>

<jsp:include page="../myPageHeader.jsp"/>

<div class="container mt-4" style="width:630px">
	<div class="text-center">
		<h4><strong>${sessionScope.loginUser.id } 님의 회원정보</strong></h4>
	</div>
	
	<div id="line" class="mt-2 mb-3"></div>
	
	<div class="inputForm">
			
		<span class="w-100 mb-3">
			<div class="label float-left">
				<div class="inputName">이름</div>
			</div>
			<div class="input float-right">
				<input type="text" class="w-100" name="id" value="${loginUser.name }" readOnly>
			</div>
		</span>
			
		<span class="w-100 mb-3">
			<div class="label float-left">
				<div class="inputName">핸드폰 번호</div>
			</div>
			<div class="input float-right">		
				<input type="text" class="w-100" name="phone" value="${loginUser.phone }" readOnly>
			</div>
		</span>
			
		<span class="w-100 mb-3">
			<div class="label float-left">
				<div class="inputName">이메일</div>
			</div>
			<div class="input float-right">	
				<input type="text" class="w-100" name="email" value="${loginUser.email }" readOnly>
			</div>
		</span>
	
		<span class="w-100 mb-3">
			<div class="label float-left">
				<div class="inputName">주소</div>
			</div>
			<div class="input float-right">	
				<input type="text" class="w-100" name="address" value="${loginUser.address }" readOnly>
			</div>
		</span>

		<span class="w-100 mb-3">
			<div class="label float-left">
				<div class="inputName">가입일</div>
			</div>
			<div class="input float-right">	
				<input type="text" class="w-100" name="regdate" value="${loginUser.regdate }" readOnly>
			</div>
		</span>

	</div>
	
	<div id="line" class="mt-2 mb-3"></div>
	
	<div class="inputForm">
		<input type="button" class="pinkBtn" value="개인 정보 수정" onclick="location.href = 'controller?type=updateMyInfoPage';">
		<input type="button" class="whiteBtn float-right" value="탈퇴하기" onclick="location.href = 'controller?type=deleteMyInfoPage';">
	</div>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<br><br><br>
</body>
<%@ include file="../img/footer.jspf" %>
</html>