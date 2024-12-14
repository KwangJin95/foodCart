<%@page import="com.mystudy.model.dao.ProductDAO"%>
<%@page import="com.mystudy.model.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<ProductVO> list = ProductDAO.getsaleList();
	request.setAttribute("list", list);
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I</title>
</head>
<style>
	#mainImg {
		width: 180px;
	}
	#maintable {
		text-align: center;
		width: 70%;
		margin-left: 280px;
	}
</style>
<body>

	<form class="imgForm">
	<table id="maintable">
		<c:forEach var="list" items="${list}" varStatus="loop" begin="0" end="5">
            
            <c:if test="${loop.index % 3 == 0}">
                <tr>
	        </c:if>
	            <td>
	                <a onclick="productDetail_go('${list.productCode}')">
	                    <img id="mainImg" src="photo/${list.categoryCode}/${list.productCode}.jpg"><br>
	                    <label>${list.productName}</label><br>
	                </a>
	            </td>
	        <c:if test="${loop.index % 3 == 2 || loop.last}">
                </tr>
            </c:if>
         
        </c:forEach>
	</table>
	</form>
	<script>
		function productDetail_go(productCode) {
	        location.href = "controller?type=detail&productCode=" + productCode;
	    }
	</script>
</body>
</html>