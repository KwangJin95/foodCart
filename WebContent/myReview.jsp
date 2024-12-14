<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 리뷰 리스트</title>
<style>
<%@ include file="img/footerStyle.jspf" %>

</style>
</head>
<script>
	function update_go(reviewNum){
		location.href = "ReviewModify.jsp?" + "reviewNum="+ reviewNum;
	}
</script>
<body>
<jsp:include page="adminPageHeader.jsp"/>

	<c:forEach var="vo" items="${reviewList }">
	    	<div class="container">
	    		<div class="row">
	            	<div class="col-2">${vo.id }</div>
	            	<div class="col-5">${vo.content }</div>
	            	<div class="col-1">${vo.record }</div>
	            	<div class="col-2">${vo.regdate }</div>	        
	                <div class="col-2"><input type="submit" value="수정/삭제" class="btn btn-primary btn-sm" onclick="update_go('${vo.reviewNum}')"></div>	         
	            </div>
            </div>
	</c:forEach>



</body>
<%@ include file="img/footer.jspf" %>
</html>