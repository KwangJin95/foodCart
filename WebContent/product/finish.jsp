<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style>
    #orderForm {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        padding: 20px;
        text-align: center;
    }
    #message {
        font-size: 24px;
        padding: 50px;
        margin-bottom: 20px;
    }
	
	.btn-darksalmon {
	    background-color: DarkSalmon;
	    color: white;
	}
	
	.btn-outline-darksalmon {
	    border-color: DarkSalmon;
	    color: DarkSalmon;
	}
    
	nav {
		background-color: DarkSalmon;
	}
	


	img {
		    display: block;
		    margin: auto;
		    height: 150px;
		    width: auto;
		}
		
	<jsp:include page="../img/footerStyle.jspf"/>
</style>
<script>
    function viewOrderList() {
    	 document.getElementById("type").value = "order"; // type 값을 "order"로 변경
         document.getElementById("orderForm").submit(); // form을 제출
    }
</script>
</head>
<body>

<jsp:include page="../header.jsp"/>

	<form id="orderForm" action="controller" method="get">
        <div id="message">구매가 완료되었습니다.</div>
        <input type="hidden" name="id" value="${id }">
		<input type="hidden" name="password" value="${password }">
		<input type="hidden" name="type" id="type" value="main">
        <div id="buttons">
        	<button type="submit" class="btn btn-darksalmon">메인으로</button>         
            <button type="button" class="btn btn-outline-darksalmon" onclick="viewOrderList()">주문목록으로</button>
    	</div>
	</form>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>	
</body>
<%@ include file="../img/footer.jspf" %>
</html>