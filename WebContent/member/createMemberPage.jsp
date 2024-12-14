<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%-- 메시지 출력 --%>
<%-- 가입하기 버튼 누른 후 메시지 --%>
<c:if test="${createSuccess == false}">
	<script>
		alert("${msg }");
	</script>
</c:if>
<%-- 아이디 중복 검사 후 메시지 --%>
<c:if test="${not empty isExistId}">
	<script>
		alert("${msg }");
	</script>
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
		width: 450px;
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
	#checkEmailBtn {
		width: 100px;
	}
	select {
		width: 47%;
	}
	.label {
		height: 50px;
		width: 24%;
		font-weight: bold;
	}
	.input {
		height: 50px;
		width: 74%;
	}
	span {
		display: inline-block;
	}
	.inputName {
		line-height: 50px;
	}
</style>
<style>
 	
<%@ include file="../img/footerStyle.jspf" %>
</style>
</head>
<body>
	<c:choose>
		<c:when test="${loginUser != null && loginUser.id == \"admin\" }">
			<jsp:include page="../adminPageHeader.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="../header.jsp"/>
		</c:otherwise>
	</c:choose>
<div class="container mt-4" style="width:630px;">
	<div class="text-center">
	<c:choose>
		<%-- 관리자 페이지에서의 회원등록 --%>
		<c:when test="${loginUser != null && loginUser.id == \"admin\" }">
			<h4><strong>회원등록</strong></h4>
		</c:when>
		<%-- 회원가입 --%> 
		<c:otherwise>
			<h4><strong>회원가입</strong></h4>
		</c:otherwise>
	</c:choose>
	</div>
	
	<div id="line" class="mt-2 mb-3"></div>
	
	<form method="post">
		
		<div class="w-100">
			<div class="inputForm float-left mr-3">
				<span class="w-100 mb-3">
					<div class="label float-left">
						<div class="inputName">아이디</div>
					</div>
					<div class="input float-right">
						<input type="text" id="id" class="w-100" name="id" placeholder=" 아이디를 입력해주세요.">
					</div>
				</span>
			</div>
			<div>
				<input type="button" id="checkIdBtn" class="whiteBtn" value="중복 확인">
			</div>
		</div>
		
		<div class="inputForm">
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">비밀번호</div>
				</div>
				<div class="input float-right">
					<input type="password" class="w-100" name="password1" placeholder=" 비밀번호를 입력해주세요.">
				</div>
			</span>
			
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">비밀번호 확인</div>
				</div>
				<div class="input float-right">
					<input type="password" class="w-100" name="password2" placeholder=" 비밀번호를 한번 더 입력해주세요.">
				</div>		
			</span>

			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">이름</div>
				</div>
				<div class="input float-right">
					<input type="text" class="w-100" name="name" placeholder=" 이름을 입력해주세요.">
				</div>
			</span>
			
			
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">핸드폰 번호</div>
				</div>
				<div class="input float-right">		
					<input type="text" class="w-100" name="phone" placeholder=" 010과 - 을 포함한 13자리 숫자로 작성해주세요." style="font-size:13px;">
				</div>
			</span>
		</div>
		
		<div class="w-100">
			<div class="inputForm float-left mr-3">
				<span class="w-100 mb-3">
					<div class="label float-left">
						<div class="inputName">이메일</div>
					</div>
					<div class="input float-right">
						<input type="text" id="email" class="w-100" name="email" placeholder=" @를 꼭 포함해주세요.">
					</div>
				</span>
			</div>
			<div>
				<input type="button" id="checkEmailBtn" class="whiteBtn" value="중복 확인">
			</div>
		</div>
			
			
		<div class="inputForm">		
			
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">주소 : </div>
				</div>
				<div class="input float-right">	
					<select name="address" class="w-45 float-right">
						<optgroup label="서울">
							<option value="서울시 강남구" default>강남구</option>
							<option value="서울시 강동구">강동구</option>
							<option value="서울시 강서구">강서구</option>
							<option value="서울시 강북구">강북구</option>
							<option value="서울시 관악구">관악구</option>
							<option value="서울시 광진구">광진구</option>
							<option value="서울시 구로구">금천구</option>
							<option value="서울시 노원구">노원구</option>
							<option value="서울시 동대문구">동대문구</option>
							<option value="서울시 도봉구">도봉구</option>
							<option value="서울시 동작구">동작구</option>
							<option value="서울시 마포구">마포구</option>
							<option value="서울시 서대문구">서대문구</option>
							<option value="서울시 성동구">성동구</option>
							<option value="서울시 성북구">성북구</option>
							<option value="서울시 서초구">서초구</option>
							<option value="서울시 송파구">송파구</option>
							<option value="서울시 영등포구">영등포구</option>
							<option value="서울시 용산구">용산구</option>
							<option value="서울시 양천구">양천구</option>
							<option value="서울시 은평구">은평구</option>
							<option value="서울시 종로구">종로구</option>
							<option value="서울시 중구">중구</option>
							<option value="서울시 중랑구">중랑구</option>
						</optgroup>
					</select>
				</div>
			</span>
		
	
			<span class="w-100 mb-3">
				<div class="label float-left">
					<div class="inputName">상세 주소</div>
				</div>
				<div class="input float-right">	
					<input type="text" class="w-100" name="address2" placeholder=" 상세 주소를 입력해주세요.">
				</div>
			</span>
		</div>
		
		<div id="line" class="mt-2 mb-3">
		</div>
		
		<input type="hidden" name="type" value="createMember">

		<div class="inputForm">
			<c:choose>
				<c:when test="${sessionScope.loginUser.id == \"admin\" }">
					<input type="button" class="pinkBtn" value="등록하기" onclick="checkValues(this.form)">
					<input type="button" class="whiteBtn float-right" value="취소" onclick="javascript:history.back()">
				</c:when>
				<c:otherwise>
					<input type="button" class="pinkBtn" value="가입하기" onclick="checkValues(this.form)">
					<input type="button" class="whiteBtn float-right" value="취소" onclick="javascript:location.href = 'index.jsp'">
				</c:otherwise>			
			</c:choose>
		</div>
	</form>
</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<script>
	$().ready(function(){
		// 중복확인 버튼
		$("#checkIdBtn").on("click", checkId);
		$("#checkEmailBtn").on("click", checkEmail);
		// 입력 박스에 입력이 들어온 경우 -> 중복확인 버튼 활성화
		$("#id").on("input", ableCheckIdBtn);
		$("#email").on("input", ableCheckEmailBtn);
		
		
	});
	// 아이디 입력 박스에 입력이 들어온 경우 -> 중복확인 버튼 활성화
	function ableCheckIdBtn() {
		$("#checkIdBtn").attr("disabled", false);
		$("#checkIdBtn").val("중복 확인");
		$("#checkIdBtn").css("color", "DarkSalmon");
		$("#checkIdBtn").css("background-color", "white");
		$("#checkIdBtn").css("border", "2px solid DarkSalmon");
	}
	
	// 아이디 입력 박스에 입력이 들어온 경우 -> 중복확인 버튼 활성화
	function ableCheckEmailBtn() {
		$("#checkEmailBtn").attr("disabled", false);
		$("#checkEmailBtn").val("중복 확인");
		$("#checkEmailBtn").css("color", "DarkSalmon");
		$("#checkEmailBtn").css("background-color", "white");
		$("#checkEmailBtn").css("border", "2px solid DarkSalmon");
	}
	
	// 아이디 중복 확인
	function checkId() {
		let id = $("#id").val();
		
		// 아이디 미입력인데 중복확인 버튼 누른 경우
		if (id == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return ;
		}
		
		$.ajax("IdCheck", {
			method : "post",
			data : {
				"id" : id
			},
			dataType : "json",
			success : function(result) {
				
				// 이미 존재하는 아이디인 경우
				if (result.isExistId == true)
					alert("이미 존재하는 아이디 입니다. 다시 입력해주세요.");
				
				// 없는 아이디인 경우 사용 가능
				else {
					alert("사용 가능한 아이디 입니다.");
					// 중복 확인 버튼 비활성화
					$("#checkIdBtn").attr("disabled", true);
					$("#checkIdBtn").val("확인 완료");
					$("#checkIdBtn").css("color", "Gainsboro");
					$("#checkIdBtn").css("background-color", "white");
					$("#checkIdBtn").css("border", "2px solid Gainsboro");

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
	// 이메일 중복 확인
	function checkEmail() {
		let email = $("#email").val();
		
		if (email == "") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return ;
		}
		
		if (!(email.trim().includes("@"))) {
			alert("이메일에 @ 가 없습니다. 다시 입력하세요.");
			$("#email").value("");
			$("#email").focus();
			return ;
		}
			
		$.ajax("EmailCheck", {
			method : "post",
			data : {
				"email" : email
			},
			dataType : "json",
			success : function(result) {
				
				// 이미 존재하는 이메일인 경우
				if (result.isExistEmail == true)
					alert("이미 존재하는 이메일 입니다. 다시 입력해주세요.");
				
				// 없는 이메일인 경우 사용 가능
				else {
					alert("사용 가능한 이메일 입니다.");
					// 중복 확인 버튼 비활성화
					$("#checkEmailBtn").attr("disabled", true);
					$("#checkEmailBtn").val("확인 완료");
					$("#checkEmailBtn").css("color", "Gainsboro");
					$("#checkEmailBtn").css("background-color", "white");
					$("#checkEmailBtn").css("border", "2px solid Gainsboro");

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

// 입력값 검증
	function checkValues(frm) {
		// 입력여부 확인 ---------------------------
		// 아이디 입력 여부
		if (frm.id.value.trim() == "") {
			alert("아이디를 입력하세요.");
			frm.id.value = "";
			frm.id.focus();
			return ;
		}
		// 아이디 중복 확인 했는지
		if ($("#checkIdBtn").prop("disabled") == false) {
			alert("아이디 중복 확인을 하지 않았습니다. 확인해주세요.");
			frm.id.focus();
			return ;
		}
		// ------------------------------------------------------
		// 비밀번호 입력 여부
		if (frm.password1.value.trim() == "") {
			alert("비밀번호를 입력하세요.");
			frm.password1.value = "";
			frm.password1.focus();
			return ;
		}
		// 비밀번호 확인 입력 여부
		if (frm.password2.value.trim() == "") {
			alert("비밀번호 확인을 입력하세요.");
			frm.password2.value = "";
			frm.password2.focus();
			return ;
		}
		// 유효값 검증
		// 비밀번호, 비밀번호 확인이 같은지 확인
		if (!(frm.password1.value == frm.password2.value)) {
			alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 입력하세요.");
			frm.password1.value = "";
			frm.password2.value = "";
			frm.password1.focus();
			return ;
		}
		// ------------------------------------------------------
		// 이름 입력 여부
		if (frm.name.value.trim() == "") {
			alert("이름을 입력하세요.");
			frm.name.value = "";
			frm.name.focus();
			return ;
		}
		// ------------------------------------------------------
		// 핸드폰 번호 입력 여부
		if (frm.phone.value.trim() == "") {
			alert("핸드폰 번호를 입력하세요.");
			frm.phone.value = "";
			frm.phone.focus();
			return ;
		}
		// 핸드폰번호 유효값 검증
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
		// ------------------------------------------------------
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
		
		
		// 이메일 중복 확인 했는지
		if ($("#checkEmailBtn").prop("disabled") == false) {
			alert("이메일 중복 확인을 하지 않았습니다. 확인해주세요.");
			frm.email.focus();
			return ;
		}
		
		
		// ------------------------------------------------------
		// 상세 주소 입력 여부
		if (frm.address2.value.trim() == "") {
			alert("상세 주소를 입력하세요.");
			frm.address2.value = "";
			frm.address2.focus();
			return ;
		}
		// -------------------------------------------------------
		frm.action = "controller";
		frm.submit();
	}

</script>
<br><br><br> 	
</body>
<%@ include file="../img/footer.jspf" %>
</html>