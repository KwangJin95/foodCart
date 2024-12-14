<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
	a {
		text-decoration: none;
		color: black;
	}
	input {
		height: 50px;
		font-size: 15px;
	}
	.label {
		font-weight: bold;
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

</style>

<title>아이디 찾기</title>
<style>
 	
<%@ include file="../img/footerStyle.jspf" %>
</style>
</head>
<body>
<%@ include file = "../header.jsp" %>

<div class="container mt-4" style="width:400px">
	<div class="mb-4 text-center">
		<h4><strong>아이디 찾기</strong></h4>
	</div>
	
	<div>
		<form method="post">
			<div class="label mb-2">이름</div>
			<input class="mb-3 w-100" type="text" name="name" placeholder=" 이름을 입력해주세요.">

			<div class="label mb-2">핸드폰 번호</div>
			<input class="mb-3 w-100" type="text" name="phone" placeholder=" 010과 - 을 포함한 13자리 숫자로 입력해주세요.">
			
			<div class="label mb-2">이메일</div> 
			<input class="mb-3 w-100" type="text" name="email" placeholder=" @를 꼭 포함해주세요.">
		
			<input type="button" class="pinkBtn" value="입력하기" onclick="inputCheck(this.form)">
			<input type="button" class="whiteBtn float-right" value="취소" onclick="history.back()">
			<input type="hidden" name="type" value="findId">
		</form>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<script>
	// 입력 검증
	function inputCheck(frm) {
		// 이름 입력 여부
		if (frm.name.value.trim() == "") {
			alert("이름을 입력하세요.");
			frm.name.value = "";
			frm.name.focus();
			return ;
		}
		// ---------------------------------------------
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
		// ---------------------------------------------
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
			alert("이메일에 @ 가 없습니다.\n다시 입력하세요.");
			frm.email.value = "";
			frm.email.focus();
			return ;
		}
		// ---------------------------------------------
		frm.action = "controller";
		frm.submit();
	}
</script>
<script>
//새로고침시 
window.onkeydown = function() {
	var kcode = event.keyCode;
	
	if(kcode == 116)
		location.href = "controller?type=findIdPage";
}
</script>
<br><br><br>
</body>
<%@ include file="../img/footer.jspf" %>
</html>