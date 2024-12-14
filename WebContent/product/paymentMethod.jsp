<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img {
        width: 100px;
    }
    .pay { 
        display: none;
    }
    .pay1 { 
        display: block;
    }
    table {
    	width: 70%;
	    text-align: center;
	    margin: 0 auto;
    }
    input[type=radio]:checked + label {
        outline: 3px solid black;
    }
    th {
    	height: 50px;
    }
</style>
<script>
	function showLinks(method) {
	    // 모든 클래스를 감추기
	    document.querySelectorAll('.pay').forEach(function(pay) {
	        pay.style.display = 'none';
	    });
	
	    // 선택한 클래스만 보이기
	    var selectedClass = document.querySelector('.' + method);
	    selectedClass.style.display = 'block';
	}
</script>
</head>
<body>
	<!-- 메인 결제 종류 -->
	<table>
		<tr>
			<th>
				<input type="radio" class="pay" id="pay1" name="pay" onclick="showLinks('pay1')" checked><label for="pay1">체크/신용카드</label>
			</th>
			<th>
				<input type="radio" class="pay" id="pay2" name="pay" onclick="showLinks('pay2')"><label for="pay2">해외발급신용카드</label>
			</th>
		</tr>
		<tr>
			<th>
				<input type="radio" class="pay" id="pay3" name="pay" onclick="showLinks('pay3')"><label for="pay3">무통장 입금</label>
			</th>
			<th>
				<input type="radio" class="pay" id="pay4" name="pay" onclick="showLinks('pay4')"><label for="pay4">휴대폰 간편결제</label>
			</th>
		</tr>
	</table>
	
	<!-- pay1 선택시 -->
	<div class="pay pay1">
	<jsp:include page="method1.jsp"/>
	</div>
	<!-- pay2 선택시 -->
	<div class="pay pay2">
	<jsp:include page="method2.jsp"/>
	</div>
	<!-- pay3 선택시 -->
	<div class="pay pay3">
	<jsp:include page="method3.jsp"/>
	</div>
	<!-- pay4 선택시 -->
	<div class="pay pay4">
	<jsp:include page="method4.jsp"/>
	</div>
</body>
</html>