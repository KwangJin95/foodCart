<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 선택결과</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>


	h3 {
	    text-align: center;
	    margin: 20px auto;
	    padding: 30px;
	}
	
	nav {
		background-color: DarkSalmon;
	}
	
	 .horizontal-line {
	    display: block;
	    margin: 0 auto;
	    width: 70%;
	    border: solid 1px grey;
	}
	
	*{margin: 0; padding: 0;}

	#header {
		width: 100%; 
		height:200px; 
		font-size: 11px; 
		line-height: 150px; 
		color: black;
		background: white; 
		text-align: center;
		padding: 75px;
	}
	
 	.mainImg {
   		max-width: 225px; 
   		height: auto; 
	}
	
	 ul {
	 	list-style: none;
	 }
	 
	 .imgForm {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding: 100px;
    }   

     .col-md-4 {
   		flex: 0 0 25%; /* 현재 설정값을 유지하면서, 30%로 설정합니다. */
    	max-width: 25%; /* 역시 30%로 설정합니다. */
    	margin: 30px;
	}
		
	.maintable li {
	    margin-bottom: 10px; 
	    display: block;
	}
	
	li > span {
  	  position: relative;
   	  left: -100px;
	}
	

<%@ include file="img/footerStyle.jspf" %>
	    	
</style>

</head>
<body>

<jsp:include page="header.jsp"/>

<div class="d-flex justify-content-center">
	<c:forEach var="vo" items="${categoryList }" begin="0" end="0">
		<h3>선택하신 '${vo.mainCategory }' 의 결과입니다</h3>
		<c:set var="categoryCode" value="${vo.categoryCode }"/>
	</c:forEach>
</div>

<div class="horizontal-line"></div>
   
   <div class="dd">
   <form class="imgForm">
   	<c:forEach var="list" items="${productList}" varStatus="loop">
  		<c:choose>
   			<c:when test="${list.categoryCode == categoryCode}">   
   				<div class="col-md-4">
	   				<ul class="maintable" onclick="productDetail_go('${list.productCode}')">
			   			<li>
			   				<img class="mainImg" src="photo/${list.categoryCode}/${list.productCode}.jpg">
			   			</li>
			   			<li class="data" style="font-weight: bold; font-size: 20px;">${list.productName}</li>
			   			<li class="data">${list.detail }</li>
			   			<li class="data"> ${list.price } 원</li>
			   			<li class="data">
			   			<span class="badge badge-primary">무료배송</span>
		   				</li>
		   			</ul>
   				</div>   
   			</c:when>
   		</c:choose>
   </c:forEach>	
   </form>
</div>


   <script>
      function productDetail_go(productCode) {
           location.href = "controller?type=detail&productCode=" + productCode;
       }
   </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
<%@ include file="img/footer.jspf" %>
</html>