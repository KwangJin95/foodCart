<%@page import="java.util.List"%>
<%@page import="com.mystudy.model.dao.ProductDAO"%>
<%@page import="com.mystudy.model.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>   
<script>
	
	function back_go() {
		alert("제품 수정을 취소하셨습니다.\n이전화면으로 돌아갑니다");
		history.back();
	}

</script>
<style>
#productDetail {
	display: inline-block;
	margin-right: 10px; 
	vertical-align: top;
}
input[type="number"] {
	text-align: right;
}
input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	appearance: none;
	margin: 0;
}
input {
	font-size: 15px;
}
option {
	font-size: 20px;
}
.uptable{
	margin: 0 auto;
}
.button {
	text-align: center;
	width: 100%;
}
#updateimg {
	width: 300px;
}
#verticalhr {
	height:40vh;
	width:0.1vw;
	border-width:0.2;
	color:#000;
	background-color:#000;
}
<%@ include file="../img/footerStyle.jspf" %>

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<br>
	<table class=uptable>
		<tr>
			<th colspan="3">
				제품 상세
			</th>
			<th>
			제품 수정
			</th>
		</tr>
		<tr>
			<td>
				<img id="updateimg" src="photo/<c:out value="${vo.categoryCode }"/>/<c:out value="${vo.productCode}" />.jpg" alt="상품이미지">
			</td>
			<td style="padding-left: 10px; padding-right: 10px;">
				<h4>제품이름 : <c:out value="${vo.productName}" /></h4>
	            <h4>가격 : <c:out value="${vo.price}" /></h4>
	            <h4>제품설명 : <c:out value="${vo.detail}" /></h4>
	        	<h4>재고 : <c:out value="${vo.stock }"/></h4>    
	        	<h4>사용여부 : <c:out value="${vo.useYn }"/></h4>   
			</td>
			<td>
			<hr id="verticalhr">
			</td>
			<td style="padding-left: 10px;">
			<form action="controller" method="post">
			<c:set var="kind" value="${kind }" />
				<c:if test="${kind eq 'all' }">
			        <label>제품코드 : </label><span id="productCode"><c:out value="${vo.productCode}"/></span><br><br>
			        <label>제품이름(*) : </label><input type="text" name="productName"><br><br>
			        <label>가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격(*) : </label>
			        <input type="number" name="price" value="0" min="0"><br><br>
			        <label id="productDetail">제품설명 : </label>
			        <textarea maxlength="1000" name="detail"></textarea><br><br>
			        <input type="hidden" name="kind" value="all">
		        </c:if>
		        <c:if test="${kind eq 'stock' }">
		        <label>재&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고(*) : </label>
		        <input type="number" name="stock" value="0" min="0"><br><br>
		        <label>사용여부(*) : </label>
		        <select name="useYn">
		        	<option></option>
		            <option value="Y">Y</option>
		            <option value="N">N</option>
		        </select><br><br>
		        <input type="hidden" name="kind" value="stock">
		        </c:if>
		        <input type="hidden" name="productCode" value="${vo.productCode }">
		        <input type="hidden" name="type" value="finupdate">
		        <div class="button">
		            <input type="submit" value="수정">
		            <input type="button" name="cancel" value="취소" onclick="back_go()">
		            <input type="reset" value="초기화">
		        </div>
		        </form>
			</td>
		</tr>
		
	</table>
	
</body>
<jsp:include page="../img/footer.jspf"/>
</html>