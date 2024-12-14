<%@page import="com.mystudy.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%	
	String reviewNum = request.getParameter("reviewNum"); 
	MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
	String id = loginUser.getId();	
	String productCode = request.getParameter("productCode") ;
	
	System.out.println(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정/삭제 구현하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script>
	function update_go(frm) {
		
		 let content = document.getElementById("content").value;
	     let record = document.getElementById("record").value;
	        
	        if (content.trim() === "") {
	            alert("리뷰 내용을 입력하세요.");
	            return false;
	        }
	        
	        if(record.trim() === "") {
	        	alert("점수를 입력하세요");
	        	return false;
	        }
	        
	        if(record > 10) {
	        	alert("올바른 값을 입력하시어요");
	        	return false;
	        }
	        
	        let id = '<%=id %>'; 
	        if (id !== ${loginUser.id}) {
	            alert("본인의 리뷰만 수정 가능합니다.");
	            console.log(${loginUser.id});
	            return false;
	        }
	        
	        frm.submit();
	        alert("수정이 완료되었습니다!");
	        
	        
	}	

	function delete_go(frm) {
	   if (confirm("정말로 삭제하시겠습니까?")) {
			frm.submit();			
	    } 
	   alert("삭제 성공하였습니다");
	   
	
	}

</script>
<style>
	fieldset {
		width: 800px;
		border: 1px solid grey;
		padding: 30px;
		margin: 100px;
		
	}
	
	button {
		background-color: DarkSalmon;
		width: 100px;
		height: 40px;
		border-radius: 20px 20px;
		border: 1px solid white;
		color: white;
	}
	
	nav {
		background-color: DarkSalmon;
	}
	
	legend {
   		text-align: center;
   		padding: 30px;
	}
		
	img {
	    display: block;
	    margin: auto;
	    height: 150px;
	    width: auto;
	}
	
	
	.horizontal-line {
	    display: block;
	    margin: 0 auto;
	    width: 70%;
	    border: solid 1px grey;	  
	    margin-botton: 30px;  
	}
	
	.btnclass {
		display: inline;
		float: right;
		margin-top: 20px;
		margin-bottom: 50px;
	}
	
	<%@ include file="img/footerStyle.jspf" %>
</style>
</head>
<body>
<jsp:include page="header.jsp"/>

<br><br>
<div class="d-flex justify-content-center" class="mr-3">
<form action="controller" method="post">
<input type="hidden" name="type" value="update">
  <fieldset>
    <legend>수정/삭제</legend><br><br>
    <div class="horizontal-line"></div>
    <div class="form-group row">
      <label for="staticID" class="col-sm col-form-label">ID</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${loginUser.getId() }">
      </div>      
    </div>
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">리뷰</label>
      <textarea class="form-control" id="content" rows="5" name="content"></textarea>
    </div>
    <div class="form-group">
      <label for="exampleSelect1" class="form-label mt-4">평점</label>
      <select class="form-select" id="exampleSelect1" name="record" id="record">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
        <option>10</option>
      </select>
    </div>
</fieldset>
	<button type="submit" class="btnclass" onclick="update_go(this.frm)">수정하기</button>
	<input type="hidden" name="id" value="${review.id}">
	<input type="hidden" name="productCode" value=<%=productCode %>>
	<input type="hidden" name="reviewNum" value=<%=reviewNum %>>
	
	
		<!-- <form action="controller" method="post"> -->
		<button type="submit" class="btnclass" name="type" value="delete" onclick="delete_go(this.frm)">삭제하기</button>
		<input type="hidden" name="reviewNum" value=<%=reviewNum %>>		
	<!-- </form>	 -->	

</form>		
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
<%@ include file="./img/footer.jspf" %>
</html>