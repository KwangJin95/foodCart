<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${updateSuccess != null }">
	<script>
		alert("${msg}");
		location.href="index.jsp";
	</script>
</c:if>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
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
	
	.btn-darksalmon {
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
<%@ include file="img/footerStyle.jspf" %>	
	
</style>
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
            
            $("img img").prop("src", "img/banner" + imgNum + ".jpg");
        });
        
        //(실습) prev 클릭시 : 이전 이미지 표시
        $("#prev").on("click", function(){
            imgNum--;
            if (imgNum < 1) imgNum = 5; //마지막 번호로 변경
            $("img img").prop("src", "img/banner" + imgNum + ".jpg");
        });
    });
</script>
<script>

</script>
</head>
<body>

<!-- <div id="index1">
	<ul>
		<li class="member"><a href="controller?type=createMemberPage">회원가입</a><li>
		<li class="member"><a href="controller?type=login">로그인</a><li>
		<li class="member"><a href="cart?type=CartList">장바구니</a><li>
		<li class="member"><a href="qa?type=QAList">고객센터</a><li>
		<li class="member"><a href="controller?type=myPage">마이페이지</a><li>			
	</ul>
</div> -->
<jsp:include page="header.jsp"/>
 
 	<div id="img">
        <img src="img/banner1.jpg">
	</div>    
  
  
  	<div id="pr_nx_button"> 
  		<button type="button" class="btn btn-darksalmon" id="prev">
		   <a href="#" style="text-decoration: none; font-size: 16px; color: white;">&#10094;</a>
		</button>
		<button type="button" class="btn btn-darksalmon" id="next">
		   <a href="#" style="text-decoration: none; font-size: 16px; color: white;">&#10095;</a>
		</button>
	
	</div>
	<div class="horizontal-line"></div>
	<span class="badge rounded-pill">best</span>
	<jsp:include page="productListMain.jsp"></jsp:include>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
<%@ include file="../img/footer.jspf" %>	
</html>