<%@page import="java.util.*"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.mystudy.model.dao.ProductDAO"%>
<%@page import="com.mystudy.model.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/product.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
	
	nav {
		background-color: DarkSalmon;
	}
	
	h3 {
		text-align: center;
		padding: 30px;
	}
	
	.listfirst {
		width: 500px;
		border: 1px solid grey;
	}

	img {
		    display: block;
		    margin: auto;
		    height: 100px;
		    width: 100px;
	}
		
	.horizontal-line {
	    display: block;
	    margin: 0 auto;
	    width: 70%;
	    border: solid 1px grey;
	   
	}
	
	#purchaseList {
		padding: 20px;
		margin: 40px auto;
	}
	
	.btn-darksalmon {
	    background-color: DarkSalmon;
	    color: white;
	}
	
	#table2 {
		font-size: 20px;
		width: 300px;
		margin-right: 200px;
		margin-top: 30px;
		margin-botton: 50px;
	}
	
	thead {
		background-color: Gainsboro;
		
	}
	
	.info {
		width: 1200px;
		margin: 0 auto;
	}
	
	#total {
		margin-right: 200px;
		margin-top: 50px;
	}
	
	.btn-primary {
		background-color: DarkSalmon;
	}
	
	
	<%@ include file="../img/footerStyle.jspf" %>

</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class="info">
	<h4>구매자 정보</h4>
	<table class="listfirst">
		<tr>
			<td style="text-align: left;">
				이름 : <c:out value="${mvo.getName() }"/><br>
				핸드폰 : <c:out value="${mvo.getPhone() }"/><br>
				이메일 : <c:out value="${mvo.getEmail() }"/><br>
				주소 : <c:out value="${mvo.getAddress() }"/><br>
			</td>
		</tr>
	</table>
	
	<hr>
	<h4>주문 목록</h4>
	<table class="list" id="purchaseList">
		<thead>
            <tr>
                <th class="list">순번</th>
                <th class="list">이미지</th>
                <th class="list">상품명</th>
                <th class="list">금액</th>
                <th class="list">주문 수량</th>
                <th class="list">합계</th>
            </tr>
        </thead>
        <tbody>
		<c:forEach items="${productCodes}" var="productCode" varStatus="status">
		            <c:set var="cnt" value="${cnts[status.index]}" />
		            <c:set var="vo" value="${ProductDAO.selectOne(productCode)}" />
		            <c:set var="saleCount" value="${cnt}" />
		            <c:set var="sum" value="${vo.price * saleCount}" />
		            
            <tr>
            <td class="list">${status.index + 1}</td>
                <td class="list"><img class="listImg" src="photo/${vo.categoryCode}/${vo.productCode}.jpg"></td>
                <td class="list">${vo.productName}</td>
                <td class="list">₩ <fmt:formatNumber type="number" value="${vo.price}" pattern="#,###" /></td>
                <td class="list"><c:out value="${saleCount}" /></td>
                <td class="list">₩ <fmt:formatNumber type="number" value="${sum}" pattern="#,###" /></td>
                
            	<form id="paymentForm" action="controller" method="get">
				    <input type="hidden" name="selectedMethod" id="selectMethodId">
				    <input type="hidden" name="kind" id="selectMethod">
				    <input type="hidden" name="type" value="pay">
				    <input type="hidden" name="total" id="total">
				    <input type="hidden" name="id" id="id">
				    <input type="hidden" name="password" id="password">
				    <input type="hidden" name="sum" value="${sum}">
					<input type="hidden" name="productCodes" value="${productCode }">
					<input type="hidden" name="saleCounts" value="${cnt }">
				</form>
            </tr>
            </c:forEach>
        </tbody>
	</table>
	</div>	
	<hr>
	
	<!-- 결재 방법 -->
	<jsp:include page="paymentMethod.jsp"/>
	
	<div id="total">
		<h4>총 금액 : ₩&nbsp;<fmt:formatNumber type="number" value="${total}" pattern="#,###" /></h4><br>
	<button type="button" name="payment" id="payment" class="btn btn-primary" onclick="pay_go()">결제하기</button>
	</div>


<script>
	function pay_go() {
		var selectedCreditMethod = document.querySelector('input[type="radio"][name="credit"]:checked'); // Credit 카드 그룹에서 선택한 라디오 버튼
		var selectedForeignCardMethod = document.querySelector('input[type="radio"][name="foreignCard"]:checked'); // Foreign Card 카드 그룹에서 선택한 라디오 버튼
		var selectedPaperMethod = document.querySelector('input[type="radio"][name="paper"]:checked'); // Paper 카드 그룹에서 선택한 라디오 버튼
		var selectedPhoneMethod = document.querySelector('input[type="radio"][name="phonePay"]:checked'); // Phone 카드 그룹에서 선택한 라디오 버튼
		var selectedMethodId;
		var selectedMethod;
		
		var id = '${loginUser.id}';
	    var password = '${loginUser.password}';
	    var total = '${total}';

	    var form = document.getElementById('paymentForm');
	    
		if (selectedCreditMethod) {
		    selectedMethodId = selectedCreditMethod.id;
		    selectedMethod = selectedCreditMethod.name;
		} else if (selectedForeignCardMethod) {
			selectedMethodId = selectedForeignCardMethod.id;
		    selectedMethod = selectedForeignCardMethod.name;
		} else if (selectedPaperMethod) {
			selectedMethodId = selectedPaperMethod.id;
		    selectedMethod = selectedPaperMethod.name;
		} else if (selectedPhoneMethod) {
			selectedMethodId = selectedPhoneMethod.id;
		    selectedMethod = selectedPhoneMethod.name;
		} else {
		    alert('결제 방법을 선택해주세요.');
		    return;
		}
		// 폼 필드 값 설정
	    document.getElementById('selectMethodId').value = selectedMethodId;
	    document.getElementById('selectMethod').value = selectedMethod;
	    document.getElementById('total').value = total;
	    document.getElementById('id').value = id;
	    document.getElementById('password').value = password;
	 	// 폼 제출
	    form.submit();
	}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
<%@ include file="../img/footer.jspf" %>
</html>