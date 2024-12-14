<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	li { 
		display: inline;
	}
	#index1 {
		font-size: 12px;
		color: grey;
		text-align: right;
	}
	nav {
		background-color: DarkSalmon;
		}
	
	.nab-item {
		padding:0 px; 
	}	
	
	.btn {
		background-color: DarkSalmon;		
	}
    div > img {
        width: 700px; /*배너크기 맞추기*/
        display: block;
        border: 1px solid #aaa;
        padding: 20px;
        margin: 50px auto 20px;       
    }    
    #pr_nx_button {
   		text-align: center;
   		margin: 20px auto;
   		padding: 20px auto;
 	 }

  	#pr_nx_button button {
    	margin: 0px 5px;/* 버튼 사이의 간격을 조절합니다. */
  	}
  	.horizontal-line {
	    display: block;
	    margin: 0 auto;
	    width: 70%;
	    border: solid 1px grey;
	}
	.badge {
		margin: 30px 300px;
		background-color: DarkSalmon;
	}
	#fixed.fixed {		
 	   position: fixed;
  	   left: 0;
  	   top: 0;
       width: 100%;
	}
	#header_img  img {
	    display: block;
	    margin: auto;
	    height: 150px;
	    width: auto;
	}
	.member a {
		text-decoration: none;
		color: black;
		font-size: 16px;
	}
</style>
</head>
<body>

<div id="index1">
	<ul>
		<c:if test="${loginUser == null}">
			<li class="member"><a href="controller?type=login">로그인</a> | <li> 
			<li class="member"><a href="controller?type=createMemberPage">회원가입</a> | <li>
		</c:if>
			
		<c:if test="${loginUser != null }">
			<li class="member"><a href="controller?type=logout">로그아웃</a> | <li>
		</c:if>
			
		<c:if test="${loginUser != null && loginUser.id != \"admin\" }">
			<li class="member"><a href="cart?type=CartList">장바구니</a> | <li>
		</c:if>
		
		<li class="member"><a href="qa?type=QAList">고객센터</a> | <li>
		
		<c:if test="${loginUser != null && loginUser.id ne 'admin'}">
			<li class="member"><a href="controller?type=myPage">마이페이지</a> | <li>
		</c:if>
		<c:if test="${loginUser != null && loginUser.id eq 'admin'}">
			<li class="member"><a href="controller?type=adminPage">관리자페이지</a> | <li>
		</c:if>
	</ul>
</div>

<div class="text-center mb-4">
		<h4><strong>${sessionScope.loginUser.id } 님의 마이페이지</strong></h4>
</div>
<nav class="navbar navbar-expand-lg justify-content-center sticky-top" data-bs-theme="dark" id="fixed">
 <div class="container-fluid"> 
 	 <a class="navbar-brand" href="index.jsp">FOOD CART</a>
 	 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
		<form action="controller">	
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav me-auto">		
				<li class="nav-item">
					<a class="nav-link" href="controller?type=selectMyInfo">내 정보 보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="controller?type=order">내 주문목록 보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="controller?type=reviewList&id=${loginUser.id }&flag=myPage&cPage=1">내 리뷰 보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="qa?type=MyQAList">내 문의내역 보기</a>
				</li> 
			</ul>	
		</div>
		</form>	
	</div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>