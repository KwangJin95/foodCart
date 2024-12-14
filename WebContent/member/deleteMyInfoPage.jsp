<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${loginUser == null}">
	<c:redirect url="index.jsp"/>
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
		width: 440px;
	}
	.disableBtn {
		font-weight: bold;
		width: 47%;
		color: Gainsboro;
		background-color: white;
		border: 2px solid Gainsboro;
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
	#checkPasswordBtn {
		width: 120px;
	}

</style>
<style>
 	
<%@ include file="../img/footerStyle.jspf" %>
</style>
<title>탈퇴하기</title>

</head>
<body>

<jsp:include page="../myPageHeader.jsp"/>

<div class="container mt-4" style="width:630px">
	<div class="text-center">
		<h4><strong>탈퇴하기</strong></h4>
	</div>
	
	<div id="line" class="mt-2 mb-3"></div>
	
	<form method="post" id="frm">
		
		<div class="w-100">
			<div class="inputForm float-left mr-3">
				<span class="w-100 mb-3">
					<div class="label float-left">
						<div class="inputName">비밀번호</div>
					</div>
					<div class="input float-right">
						<input type="password" id="password" class="w-100" name="password" placeholder=" 비밀번호를 입력해주세요.">
					</div>
				</span>
			</div>
			<div>
				<input type="button" id="checkPasswordBtn" class="whiteBtn" value="비밀번호 확인">
			</div>
		</div>
		
		<div id="line" class="mt-2 mb-3"></div>
		
		<div class="inputForm">
			<input type="button" class="whiteBtn" value="취소" onclick="history.back()">
			<input type="button" class="disableBtn float-right" value="탈퇴" id="deleteMyInfoBtn" onclick="deleteMyInfo(this.form)" disabled>
		</div>
		
		<input type="hidden" name="id" value="${loginUser.id}">
		<input type="hidden" name="type" value="deleteMyInfo">
		
	</form>
</div>
		
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	
<script>
	$().ready(function () {
		$("#checkPasswordBtn").on("click", checkPassword);
		$("#deleteMyInfoBtn").on("click", deleteMyInfo);
	});
	
	function checkPassword() {
		let password = $("#password");
		
		// 입력 여부 검증
		if (password == null || password.val().trim() == "") {
			alert("비밀번호를 입력하세요.");
			password.val("");
			password.focus();
			return ;
		}
			
		$.ajax("PasswordCheck", {
			method : "post",
			data : {
				"password" : password.val()
			},
			dataType : "json",
			success : function(result) {
				if (result.isEqual == true) {
					$("#checkPasswordBtn").attr("disabled", true);
					$("#checkPasswordBtn").val("확인 완료");
					$("#checkPasswordBtn").attr("width", "100px");
					$("#checkPasswordBtn").css("color", "Gainsboro");
					$("#checkPasswordBtn").css("background-color", "white");
					$("#checkPasswordBtn").css("border", "2px solid Gainsboro");
					
					$("#deleteMyInfoBtn").attr("disabled", false);
					$("#deleteMyInfoBtn").css("color", "white");
					$("#deleteMyInfoBtn").css("background-color", "DarkSalmon");
					$("#deleteMyInfoBtn").css("border", "0");
					
					alert("탈퇴 버튼을 눌러주십시오.");
				}
				else {
					alert("비밀번호가 틀립니다. 다시 입력하세요.");
					password.val("");
					password.focus();
					return ;
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert(">> Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
			}
		});
	}
	function deleteMyInfo(frm) {
		frm.action = "controller";
		frm.submit();
	}
	
</script>
<br><br><br>
<%@ include file="../img/footer.jspf" %>
</body>
</html>