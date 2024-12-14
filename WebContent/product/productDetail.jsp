<%@page import="com.mystudy.model.dao.ProductDAO"%>
<%@page import="com.mystudy.model.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:set var="categoryName" value="null"/>
	<c:choose>
		<c:when test="${vo.categoryCode eq '100' }">
			<c:set var="categoryName" value="고기/해산물/계란"/>
		</c:when>
		<c:when test="${vo.categoryCode eq '200' }">
			<c:set var="categoryName" value="채소/과일"/>
		</c:when>
		<c:when test="${vo.categoryCode eq '300' }">
			<c:set var="categoryName" value="간편식"/>
		</c:when>
		<c:when test="${vo.categoryCode eq '400' }">
			<c:set var="categoryName" value="간식"/>
		</c:when>
		<c:when test="${vo.categoryCode eq '500' }">
			<c:set var="categoryName" value="음료"/>
		</c:when>
		<c:when test="${vo.categoryCode eq '600' }">
			<c:set var="categoryName" value="유제품"/>
		</c:when>
		<c:when test="${vo.categoryCode eq '700' }">
			<c:set var="categoryName" value="건강식품"/>
		</c:when>
	</c:choose>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style>
	
	#purchaseForm {
		display: flex;
	 	justify-content: center;
		align-items: center;
		padding: 30px;
	}
	
	.detailTable {
    	list-style: none;
    	padding: 0;
	}
	
	
	nav {
		background-color: DarkSalmon;
	}
	
	.btn-darksalmon {
	    background-color: DarkSalmon;
	    color: white;
	}
	
	.btn-outline-darksalmon {
	    border-color: DarkSalmon;
	    color: DarkSalmon;
	}
	
	a img {
	    display: block;
	    margin: auto;
	    height: 150px;
	    width: auto;
	}
	
	h3 {
		text-align: center;
		padding: 30px;
	}
	
	.horizontal-line {
	    display: block;
	    margin: 0 auto;
	    width: 70%;
	    border: solid 1px grey;
	}
	
	ul {
		list-style: none;
		
	}
	
	.detailTable {
		margin-top: 50px;
	}
	
	.detailTable li {
   		margin-bottom: 10px;
   		display: block;
   		margin: 10px;
	}
	
	.one {
		font-size: 30px;
	}
	
	.two {
		font-size: 25px;
	}
	#cnt {
		margin: 20px;
	}
	
	<%@ include file="../img/footerStyle.jspf" %>

	
	
</style>
<%--<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/product.css"> --%>
</head>
<body>

<jsp:include page="../header.jsp"/>
   	
   	<div class="container mx-auto">
    <h3><c:out value="${categoryName}" /></h3>
    
    <div class="horizontal-line"></div>       
    
    <form id="purchaseForm" action="" method="post">	 
	    <div class="row">
	    <div class="col">
	        <img id="photo" src="photo/<c:out value="${vo.categoryCode }"/>/<c:out value="${vo.productCode}" />.jpg" style="width: 400px; alt="상품이미지">
	    </div>	    
	    <div class="col">
	        <ul class ="detailTable">
		        <li class="one"><c:out value="${vo.productName}" /></li>
		        <li class="two">가격 : <c:out value="${vo.price}" /></li>
		        <li class="three">상세정보 : </li>
		        <li class="three"><c:out value="${vo.detail}" /></li>
		        <form class="form-inline">		        
		         <label for="수량">&nbsp;&nbsp;주문 수량 </label>
  				 <input type="number" name="cnt" class="form-control" id="cnt" value="0" min="0" max="<c:out value="${vo.stock}" />">
		        </form>
		        <!-- 재고수량 이상 구매 누르면 경고표시.(재고가 부족합니다) -->
	        </ul>
		        <input type="hidden" name="id" value="${id}">
		        <input type="hidden" name="password" value="${password}">
		        <input type="hidden" name="productCode" value="${vo.productCode}">
		        <input type="hidden" name="type" id="type" value="">
		        <br><br>
		        <button type="button" name="cart" class="btn btn-darksalmon" onclick="cart_go()">장바구니</button>
		  		<button type="button" name="purchase" class="btn btn-outline-darksalmon" onclick="purchase_go()">구매하기</button>
		  		<button type="button" class="btn btn-darksalmon" onclick="reviewList_go(${vo.productCode})">리뷰보기</button>
	   	</div>
	    </div>
    </form>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
</script>  
<script>
	function cart_go() {
	    var form = document.getElementById("purchaseForm");
	    var cnt = document.getElementById("cnt").value;
	    
	    if (cnt == 0){	
			alert("수량을 선택해주세요");
			return;
		}
	    form.action = "cart?type=Insert";
	    form.method = "post";
	    form.innerHTML = '<input type="hidden" name="type" value="Insert">' + 
	                     '<input type="hidden" name="productCode" value="${vo.productCode}">' + 
	                     '<input type="hidden" name="cnt" value="' + cnt + '">' + 
	    form.submit();
	}
	function purchase_go() {
		var cnt = document.getElementById("cnt").value; // cnt 값 가져오기
		var form = document.getElementById("purchaseForm");
		var type = document.getElementById("type").value;
		var productCode = "${vo.productCode}";
		var password = "${password }";
		if (cnt == 0){	
			alert("수량을 선택해주세요");
			return;
		} else {
			type = "purchase";
			form.action = "controller";
		    form.method = "post";
		    form.innerHTML = '<input type="hidden" name="type" value="' + type + '">' + 
		                     '<input type="hidden" name="productCode" value="${vo.productCode}">' + 
		                     '<input type="hidden" name="cnt" value="' + cnt + '">' + 
		                     '<input type="hidden" name="kind" value="productLogin">';
		    form.submit();
		}
	}
	
	function reviewList_go(frm) {
		var productCode = frm;
		window.location.href = "controller?type=reviewList&productCode=" + productCode;
	}
	
    function productDetail_go(productCode) {
        location.href = "controller?type=detail&productCode=" + productCode;
    }
</script>  
</body>
<%@ include file="../img/footer.jspf" %>
</html>