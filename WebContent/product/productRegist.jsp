<%@page import="java.util.List"%>
<%@page import="com.mystudy.model.dao.ProductDAO"%>
<%@page import="com.mystudy.model.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>   
<script>
	//category 값이 변경되면 제품 코드에 표시되는 문자 변경
	function updateproductCode() {
	    var categorySelect = document.getElementById("categorySelect");
	    var productCode = document.getElementById("productCode");
	    var productCodeInput = document.getElementById("productCodeInput"); // 추가된 부분
	    
	    var numCode = '${sixCode}';
	    // 카테고리 선택 값에 따라 제품 코드 변경
	    productCode.textContent = categorySelect.value + numCode;
	    productCodeInput.value = categorySelect.value + numCode;
	}
	function back_go() {
		alert("제품 등록을 취소하셨습니다.\n이전화면으로 돌아갑니다");
		history.back();
	}

</script>
<style>
	label {
	    display: inline-block; /* 라벨을 인라인 블록 엘리먼트로 설정하여 같은 라인에 표시 */
	    margin-right: 10px; /* 라벨과 textarea 사이의 간격을 조정 (원하는 크기로 조절) */
	    vertical-align: top; /* 라벨과 textarea의 맨 위 부분을 정렬 */
	}


	.field{
		width: 700px;
		margin: 50px auto;
		
	}
	
	h3 {
		text-align: center;
		padding: 30px;
	}
	.op label,
	.op input,
	.op select,
	.op textarea {
	    margin-bottom: 10px; 
	}
	
	
	footer {
	   	
	    bottom: 0;
	    left: 0;
	    width: 100%;
	}
	
<%@ include file="../img/footerStyle.jspf" %>

</style>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/product.css">
</head>
<body>
<jsp:include page="../adminPageHeader.jsp"/>
<h3>제품등록</h3>
<hr>
<form action="controller" method="post">
   <div class="field">
   <table>
		<tr>
			<label>제품코드(*) : </label><span id="productCode">카테고리를 선택해주세요</span><br><br>
        <label>제품이름(*) : </label><input type="text" name="productName"><br><br>
        <label>카테고리(*) : </label>
        <select id="categorySelect" name="categoryCode" onchange="updateproductCode()">
            <option></option>
            <option value="100">고기/해산물/계란</option>
            <option value="200">채소/과일</option>
            <option value="300">간편식</option>
            <option value="400">간식</option>
            <option value="500">음료</option>
            <option value="600">유제품</option>
            <option value="700">건강식품</option>
        </select>
      	<br><br>
        <label>가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격(*) : </label>
        <input type="number" name="price" value="0" min="0"><br><br>
        <label>재&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고 : </label>
        <input type="number" name="stock" value="0" min="0"><br><br>
        <label>제품설명 : </label>
        <textarea maxlength="1000" name="detail" cols="40"></textarea><br><br>
        <label>사용여부(*) : </label>
        <select name="useYn">
        	<option></option>
            <option value="Y">Y</option>
            <option value="N">N</option>
        </select><br>
         </div>
         <input type="hidden" name="productCode" id="productCodeInput">
         <input type="hidden" name="type" value="finresist">
        <div class="button">
            <input type="submit" value="등록">
            <input type="button" name="cancel" value="취소" onclick="back_go()">
            <input type="reset" value="초기화">
        </div>
		</tr>
   </table>
    </div>
</form>
</body>
<%@ include file ="../img/footer.jspf" %>
</html>