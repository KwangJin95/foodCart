<%@page import="com.mystudy.model.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.model.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/product.css">
<style>
<%@ include file="../img/footerStyle.jspf" %>

	h3 {
		text-align: center;
		padding: 30px;
	}

</style>
</head>
<body>
<jsp:include page="../adminPageHeader.jsp"/>


	<h3>제품 리스트</h3>
	<table class="list">
		<thead>
			<tr>
				<th id="col1" class="list">제품사진</th>
				<th id="col2" class="list">제품명</th>
				<th id="col3" class="list">제품가격</th>
				<th id="col4" class="list">제품코드</th>
				<th id="col5" class="list">제품재고</th>
				<th id="col6" class="list">판매량</th>
				<th id="col7" class="list">카테고리</th>
				<th id="col8" class="list">사용여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td class="list"><img class="listImg" src="photo/${vo.categoryCode }/${vo.productCode}.jpg"></td>
				<td class="list">${vo.productName}</td>
				<td class="list">${vo.price}</td>
				<td class="list"><a href="controller?type=productUp&kind=all&productCode=${vo.productCode }">${vo.productCode}</a></td>
				<td class="list"><a href="controller?type=productUp&kind=stock&productCode=${vo.productCode }">${vo.stock}</a></td>
				<td class="list">${vo.saleCount}</td>
				<td class="list">${vo.categoryCode}</td>
				<td class="list">${vo.useYn}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<%@ include file ="../img/footer.jspf" %>
</html>