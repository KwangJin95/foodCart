<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<title>회원 정보 수정</title>
<style>
 	
<%@ include file="../img/footerStyle.jspf" %>
</style>
</head>
<body>
<jsp:include page="../adminPageHeader.jsp"/>
<div class="container mt-4" style="width:630px;">
	<div class="text-center">
		<h4><strong>${requestScope.updateVO.id } 님의 회원 정보 수정</strong></h4>
	</div>
	
	<div id="line" class="mt-2 mb-3"></div>
	
	<form method="post">
	
		<div class="inputForm">
			
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">새 비밀번호</div>
				</div>
				<div class="input float-right">
					<input type="text" class="w-100" name="password" value="${updateVO.password}" placeholder="새 비밀번호를 입력해주세요.">
				</div>
			</span>	

			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">이름</div>
				</div>
				<div class="input float-right">
					<input type="text" class="w-100" name="name" value="${updateVO.name }" placeholder="이름을 입력해주세요.">
				</div>
			</span>
		
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">핸드폰 번호</div>
				</div>
				<div class="input float-right">
					<input type="text" class="w-100" name="phone" value="${updateVO.phone }" placeholder="010과 - 을 포함한 13자리 숫자로 작성해주세요.">
				</div>		
			</span>
				
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">이메일</div>
				</div>
				<div class="input float-right">
					<input type="text" class="w-100" name="email" value="${updateVO.email }" placeholder="@를 꼭 포함해주세요." readOnly>
				</div>
			</span>
				
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">주소</div>
				</div>	
				<div class="input float-right">
					<input type="text" class="w-100" name="address" value="${updateVO.address }">
				</div>
			</span>	
					
		</div>
		
		<div id="line" class="mt-2 mb-3"></div>
		
		<input type="hidden" name="type" value="updateMember">
		<input type="hidden" name="id" value="${updateVO.id }">
		<input type="hidden" name="regdate" value="${updateVO.regdate }">

		<div class="inputForm">
			<input type="button" class="pinkBtn" value="수정하기" onclick="checkValues(this.form)">
			<input type="button" class="whiteBtn float-right" value="취소" onclick="history.back()">
		</div>
	</form>	
</div>	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	
<script>
// 입력값 검증
	function checkValues(frm) {
		// 입력여부 확인 ---------------------------
		// 새 비밀번호 입력 여부
		if (frm.password.value.trim() == "") {
			alert("새 비밀번호를 입력하세요.");
			frm.password.value = "";
			frm.password.focus();
			return ;
		}
		// -----------------------------------
		// 이름 입력 여부
		if (frm.name.value.trim() == "") {
			alert("이름을 입력하세요.");
			frm.name.value = "";
			frm.name.focus();
			return ;
		}
		// -----------------------------------
		// 핸드폰 번호 입력 여부
		if (frm.phone.value.trim() == "") {
			alert("핸드폰 번호를 입력하세요.");
			frm.phone.value = "";
			frm.phone.focus();
			return ;
		}
		// 핸드폰번호 검증
		// 1. 13자리 인지
		let phone = frm.phone.value;
		if (phone.length != 13) {
			alert("핸드폰 번호 길이가 13자리가 아닙니다.\n다시 입력하세요.");
			frm.phone.focus();
			return ;
		}
		// 2. 010으로 시작하는지
		if (phone.substring(0, 3) != "010") {
			alert("핸드폰 번호가 010 으로 시작하지 않습니다.\n다시 입력하세요.");
			frm.phone.focus();
			return ;
		}
		// 3. - 위치와 여부
		if (phone.charAt(3) != "-" ||
			phone.charAt(8) != "-") {
			alert("- 문자 입력이 올바르지 않습니다.\n다시 입력하세요.");
			frm.phone.focus();
			return ;
		}
		// 4. 나머지 숫자자리 숫자인지
		// 010-( 여기 )-1111
		let phoneMid = phone.substring(4, 8);
		// 010-1111-( 여기 )
		let phoneFoot = phone.substring(9, 13);
		
		for (let i = 0; i <= 4; i++) {
			if (phoneMid[i]  < "0" || phoneMid[i]  > "9" ||
				phoneFoot[i] < "0" || phoneFoot[i] > "9") {
				alert("숫자로 입력해야 합니다.\n다시 입력하세요.");
				frm.phone.focus();
				return ;
			}
		}
		// -----------------------------------
		// 이메일 입력 여부
		if (frm.email.value.trim() == "") {
			alert("이메일을 입력하세요.");
			frm.email.value = "";
			frm.email.focus();
			return ;
		}
		// 유효값 검증
		// 이메일 @ 여부만 확인
		if (!(frm.email.value.trim().includes("@"))) {
			alert("이메일에 @ 가 없습니다. 다시 입력하세요.");
			frm.email.value = "";
			frm.email.focus();
			return ;
		}
		// -----------------------------------
		// 주소 입력 여부
		if (frm.address.value.trim() == "") {
			alert("주소를 입력하세요.");
			frm.address.value = "";
			frm.address.focus();
			return ;
		}
			
		// -----------------------------------
		frm.action = "controller";
		frm.submit();
	}
</script>
<br><br><br>
</body>
<%@ include file="../img/footer.jspf" %>
</html>