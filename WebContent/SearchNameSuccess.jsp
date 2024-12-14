<%@page import="com.mystudy.model.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String productName = request.getParameter("productName"); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색성공화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script>
	function reviewList_go(frm) {
		frm.submit();
	}
	
    function productDetail_go(productCode) {
        location.href = "controller?type=detail&productCode=" + productCode;
    }
</script>
<style>

	h3 {
		text-align: center;
		margin: 50px auto;
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
   		max-width: 225px; /* 필요한 만큼 조절하세요 */
   		height: auto; /* 이렇게 하면 이미지의 가로세로 비율이 유지됩니다 */	
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
    
    .row {
    	margin-top:100px;
    	margin-left: 110px;
    }

        
    #header_img  img {
	    display: block;
	    margin: auto;
	    height: 170px;
	    width: auto;
	}	
	
	
	.badge-primary {
  	  background-color: DarkSalmon;
	}
	
	
	.maintable li {
	    margin-bottom: 10px;
	    display: block; 
	}
	
	.container {
		padding: 50px;
	}
	
<%@ include file="img/footerStyle.jspf" %>

	

</style>
</head>
<body>



<jsp:include page="header.jsp"/>

<div class="d-flex justify-content-center">
	<h3>검색하신 <%=productName %> 에 대한 총 "${nameCount }" 건의 결과입니다.</h3>
</div>	

<div class="horizontal-line"></div>

	<div class="container">	
		<div class="row">
		 <c:forEach var="list" items="${productList}" varStatus="loop">
		 	<div class="col-md-4">
		           <ul class="maintable" onclick="productDetail_go('${list.productCode}')">
			   			<li><img class="mainImg" src="photo/${list.categoryCode}/${list.productCode}.jpg"></li>
			   			<li class="data" style="font-weight: bold; font-size: 20px;">${list.productName}</li>
			   			<li class="data">${list.detail }</li>
			   			<li class="data"> ${list.price } 원</li>
			   			<li class="data">
			   			<span class="badge badge-primary">무료배송</span>
			   			</li>
		   			</ul>
		   	 </div>	
		   </c:forEach>	
		   </div>
	   </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
<%@ include file="img/footer.jspf" %>
</html>