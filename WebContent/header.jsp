<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	li { 
		display: inline;
	}
	#index1 {
		text-align: right;
		font-size: 16px;
		text-decoration: none;
		color: black;
	}
	nav {
		background-color: DarkSalmon;
		}
	
	.nab-item {
		padding:0; 
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
		<c:if test="${loginUser != null && loginUser.id != \"admin\" }">
			<li class="member"><a href="qa?type=CS">고객센터</a> | <li>
		</c:if>
		<c:if test="${loginUser != null && loginUser.id ne 'admin'}">
			<li class="member"><a href="controller?type=myPage">마이페이지</a> | <li>
		</c:if>
		<c:if test="${loginUser != null && loginUser.id eq 'admin'}">
			<li class="member"><a href="controller?type=adminPage">관리자페이지&nbsp;</a><li>
		</c:if>
	</ul>
</div>



<div id="header_img">
	<a href="../project/index.jsp">
		<img src="../project/img/logo.png">
    </a>
</div>

<nav class="navbar navbar-expand-lg justify-content-center sticky-top" data-bs-theme="dark" id="fixed">
 <div class="container-fluid"> 
 	 <a class="navbar-brand" href="../project/index.jsp">FOOD CART</a>
 	 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
		<form action="controller">	
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav me-auto">		
				<li class="nav-item">
					<a class="nav-link" href="controller?type=categorySearch&categoryCode=100">육류/해산물/계란</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="controller?type=categorySearch&categoryCode=200">채소/과일</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="controller?type=categorySearch&categoryCode=300">간편식</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="controller?type=categorySearch&categoryCode=400">간식</a>
				</li> 
				<li class="nav-item">
					<a class="nav-link" href="controller?type=categorySearch&categoryCode=500">음료</a>
				</li> 		
				<li class="nav-item">
					<a class="nav-link" href="controller?type=categorySearch&categoryCode=600">유제품</a>
				</li>  
				<li class="nav-item">
					<a class="nav-link" href="controller?type=categorySearch&categoryCode=700">건강식품</a>
				</li>	
			</ul>	
		</div>
		</form>	
		<form action="controller" onsubmit="return searchName()" class="d-flex">	 
			<input class="form-control me-sm-2" type="search" placeholder="Search" id="search" name="productName" aria-laber="Search">
			 <button class="btn btn-secondary my-2 my-sm-0" type="submit">search</button>		 
			<input type="hidden" name="type" value="search">
		</form>
	</div>
 </nav>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>

<script>
	function searchName() {
		let productName = document.getElementById("search").value;
		if ( productName == "") {
			alert("검색어를 다시 입력해주세요");
			return false;
		}
		return true;
	}		
	
   $(document).ready(function(){
        let imgNum = 1;
        
        // next 클릭시 : 다음 이미지 표시(img 태그 src 속성값 변경)
        $("#next").click(function(){
            imgNum++;
            if (imgNum > 5) imgNum = 1; //처음 이미지 번호로 변경
            
            $("#img img").prop("src", "img/banner" + imgNum + ".jpg");
        });
        
        //(실습) prev 클릭시 : 이전 이미지 표시
        $("#prev").on("click", function(){
            imgNum--;
            if (imgNum < 1) imgNum = 5; //마지막 번호로 변경
            
            $("#img img").prop("src", "img/banner" + imgNum + ".jpg");
        });
    });
</script>
</body>
</html>