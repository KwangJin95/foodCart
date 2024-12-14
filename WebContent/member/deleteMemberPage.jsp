<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 페이지</title>
</head>
<body>
<form method="post" id="frm">
	<input type="hidden" name="id" value="${id }">	
</form>
<script>
	window.onload = function (){
		if (confirm("정말로 삭제하시겠습니까?")) {
			let frm = document.getElementById("frm");
			frm.action = "controller?type=deleteMember";
			frm.submit();
		}
		else
			location.href = "controller?type=manageMembersPage";
		
	};
</script>
</body>
</html>