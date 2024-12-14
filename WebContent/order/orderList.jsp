<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
	.ordertable {
	    text-align: center;
	    border: 1px solid black;
	    border-collapse: collapse;
	    height: 30px;
	    padding: 5px;
	    width: 1200px;
	}
	
	<%@ include file="../img/footerStyle.jspf" %>
</style>
</head>
<body>
<jsp:include page="../myPageHeader.jsp"/>
	<div class="container" >
	<form id="purchaseDateForm" action="controller" method="get">
		<input type="date" id="purchaseDate" name="purchaseDate">
		<input type="hidden" name="type" value="order"> 
		<input type="button" name="orderListSearch" value="검색" onclick="orderListSearch_go()">
	</form>
	<script>
		function orderListSearch_go() {
			purchaseDate = document.getElementById("purchaseDate").value;
			document.getElementById("purchaseDateForm").submit();
		}
	</script>
	
		<table id="ordertable" class="ordertable">
			<thead>
				<tr>
					<th class="ordertable">주문번호</th>
					<th class="ordertable">결제방식</th>
					<th class="ordertable">제품코드</th>
					<th class="ordertable">주문수량</th>
					<th class="ordertable">제품별 주문가격</th>
					<th class="ordertable">주소</th>
					<th class="ordertable">구매날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="vo">
					<tr>
						<td class="ordertable">${vo.orderNumber }</td>
						<td class="ordertable">${vo.payment }</td>
						<td class="ordertable"><a href="controller?type=detail&productCode=${vo.productCode }">${vo.productCode }</a></td>
						<td class="ordertable">${vo.orderCount }</td>
						<td class="ordertable">₩ <fmt:formatNumber type="number" value="${vo.totalPrice }" pattern="#,###" /></td>
						<td class="ordertable">${vo.address }</td>
						<td class="ordertable">${vo.purchaseDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
<%@ include file="../img/footer.jspf" %>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>	
</body>
</html>