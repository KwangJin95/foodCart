<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<% 
	String productCode = request.getParameter("productCode") ;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰확인화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
	nav {
		background-color: DarkSalmon;
	}
</style>
<style>
	h3 {
		text-align: center;
		padding: 30px;
	}
	
	.horizontal-line {
	    display: block;
	    margin: 0 auto;
	    width: 70%;
	    border: solid 1px grey;	    
	}
	
	li {
		display: inline;
	}
	
	.paging{ list-style: none; }
	
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding : 3px 5px;
		border: 1px solid blue;
		font-weight: bold;
		color: black;
	}
	
	.paging .disable {
		border: 1px solid #00b3dc;
		padding : 3px 5px;
		color : silver;
	}
	
	.paging .now {
		border: 1px solid #ff4aa5;
		padding : 3px 5px;
		color : black;
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
	
	.row {		
		text-align: center;
		padding: 10px;
	}
	
	ol {
		width: 300px;
  		margin-left: auto;
  		margin-right: auto;
	}
	
	fieldset {
		width: 800px;
	}
	
	img {
	    display: block;
	    margin: auto;
	    height: 150px;
	    width: auto;
	}
	
	
	.reviewForm	{
		margin-left: 500px;
	}
	
	.btn-primary {
		margin-top: 10px ;		
		margin-bottom: 30px;
		
	}
	
	<%@ include file="./img/footerStyle.jspf" %>
</style>
</head>
<body>


<c:if test="${flag == null }">
	<jsp:include page="header.jsp"/>
</c:if>


<c:if test="${flag != null }">
	
	<jsp:include page="myPageHeader.jsp"/>
</c:if>


<h3>리뷰 페이지</h3>

<div class="horizontal-line"></div>


	<div class="container">
		<div class="row">
				<div class="col-2">작성자</div>	
				<div class="col-5">내용</div>	
				<div class="col-1">평점</div>
				<div class="col-2">작성날짜</div>
				<div class="col-2"></div>			 
		</div>	
	</div>
	<hr>
	
		
		<div class="diffiult">
		<c:choose>
		<c:when test="${empty rvList }">
			<div class="col-6">
					<h3>현재 등록된 리뷰가 없습니다</h3>
			</div>
		</c:when>
		<c:otherwise>	
	    	<c:forEach var="vo" items="${rvList }">
	    	<div class="container">
	    		<div class="row">
	            	<div class="col-2">${vo.id }</div>
	            	<div class="col-5">${vo.content }</div>
	            	<div class="col-1">${vo.record }</div>
	            	<div class="col-2">${vo.regdate }</div>

					<c:choose>
						<c:when test="${vo.id != loginUser.id}">
			            	<div class="col-2"><input type="submit" value="수정/삭제" style="background-color: white; color:gray; border-color: gray;"class="btn btn-primary btn-sm" onclick="update_go('${vo.reviewNum}')" disabled></div>
						</c:when>
		            	<c:otherwise>
			            	<div class="col-2"><input type="submit" value="수정/삭제" class="btn btn-primary btn-sm" onclick="update_go('${vo.reviewNum}')"></div>
		            	</c:otherwise>
					</c:choose>
	            
	            </div>
            </div>
	    	</c:forEach>
	    </c:otherwise>
	    </c:choose>	
	    </div>	
	    <br>	
	    
	    <%--페이징 처리시작 --%>			
		<div class="pagingclass text-center">	
			<ol class="paging">
			<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:if test="${rp.beginPage == 1 }">
				    <li class="disable"> 이전으로 </li>
				</c:if>
				<c:if test="${rp.beginPage != 1 }">
				    <li>
				        <a href="controller?type=reviewList&cPage=${rp.beginPage() - 1}">이전으로</a>
				    </li>
				</c:if>
				
				<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
				<c:forEach var="pageNo" begin="${rp.beginPage }" end="${rp.endPage }">
				<c:if test="${pageNo == rp.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>
				<c:if test="${pageNo != rp.nowPage }">
					<li>
						<a href="controller?type=reviewList&cPage=${pageNo }">${pageNo }</a>
					</li>
				</c:if>
				</c:forEach>						
	
				
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:if test="${rp.endPage >= rp.totalPage }">
					<li class="disable">다음으로</li>
				</c:if>
				<c:if test="${rp.endPage < rp.totalPage }">
					<li>
						<a href="controller?type=reviewList&cPage=${rp.endPage + 1 }">다음으로</a>
					</li>
				</c:if>
			</ol>
		</div>
		<br>
		<br>
		<br>

<c:choose>		
	<c:when test="${flag == null && loginUser != null}">		
		<div class="reviewForm">
		<div class="form-group mx-auto">
			<form action="controller" method="get" onsubmit="return checkForm()">
			 <fieldset>
			 	<label for="staticEmail" class="col-sm-2 col-form-label">ID</label>
			 	<div class="col-sm-10">
		        	<input type="text" class="form-control-plaintext" id="staticEmail" value="${loginUser.getId() }" readonly> 
		    	</div>
				<div class="form-group">
				<label for="리뷰" class="form-label mt-4">리뷰</label>
		    		<textarea class="form-control" id="content" name="content" rows="5" style="height: 166px;"></textarea>
				</div>
				<div class="form-group">
				<label for="exampleSelect1" class="form-label mt-4">평점</label>
		     	<select class="form-select" name="record" id="record">
			     	<option>1</option>
			        <option>2</option>
			        <option>3</option>
			        <option>4</option>
			        <option>5</option>
			        <option>6</option>
			        <option>7</option>
			        <option>8</option>
			        <option>9</option>
			        <option>10</option>
		      	</select>
		      	</div>		
				<button type="submit" class="btn btn-primary">작성하기</button>
				<input type="hidden" name="productCode" value=<%=productCode %>>
				<input type="hidden" name="type" value="insert">	
			</fieldset>
			</form>	
		</div>
		</div>
	</c:when>
</c:choose>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
	function update_go(reviewNum){
		location.href = "ReviewModify.jsp?" + "reviewNum="+ reviewNum;
	}
</script>
<script>
    function checkForm() {
        let content = document.getElementById("content").value;
        let record = document.getElementById("record").value;
        
        if (content.trim() === "") {
            alert("리뷰 내용을 입력하세요.");
            return false; // Submit을 막습니다.
        }
        
        if(record.trim() === "") {
        	alert("점수를 입력하세요");
        	return false;
        }
        
        if(record > 10) {
        	alert("올바른 값을 입력하시어요");
        	return false;
        }
        alert("리뷰 입력이 완료되었습니다!");
        
        return true;
    }
</script>
</body>
<%@ include file="./img/footer.jspf" %>	
</html>