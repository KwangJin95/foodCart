<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script>
        function main_go() {
            alert("결제를 취소하셨습니다.\n메인화면으로 돌아갑니다");
            location.href="controller?type=main"
        }
    </script>
    <style>
    
     	<%@ include file="../img/footerStyle.jspf" %>
     	
        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            appearance: none;
            margin: 0;
        }
        .creditNum, .foreignNum, .phonePayNum {
            width: 15%;
        }
        fieldset {
            width: 35%;
            margin-left: auto;
            margin-right: auto;
        }
        img {
            margin-left: 300px;
        }
        #paybutton {
            text-align: right;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <c:set var="kind" value="${kind}"/>
    <c:set var="company" value="${selectedMethod}"/>
    
    <form class="payscreen" action="controller" method="get">
        <img src="product/payment/${kind}/${company}.png"><br>
        <fieldset>
            <c:choose>
                <c:when test="${'credit' eq kind}">
                    카드번호 :
                    <input type="number" name="Num1" class="creditNum" maxlength="4">&nbsp;-
                    <input type="password" name="Num2" class="creditNum" maxlength="4">&nbsp;-
                    <input type="password" name="Num3" class="creditNum" maxlength="4">&nbsp;-
                    <input type="number" name="Num4" class="creditNum" maxlength="4"><br>
                    cvv :
                    <input type="password" name="password" class="creditNum" maxlength="3" title="카드 뒷면의 3자리 숫자">
                </c:when>
                <c:when test="${'foreignCard' eq kind}">
                    카드번호 :
                    <input type="number" name="Num1" class="foreignNum" maxlength="4">&nbsp;-
                    <input type="password" name="Num2" class="foreignNum" maxlength="4">&nbsp;-
                    <input type="password" name="Num3" class="foreignNum" maxlength="4">&nbsp;-
                    <input type="number" name="Num4" class="foreignNum" maxlength="4"><br>
                    cvv :
                    <input type="password" name="password" class="foreignNum" maxlength="3" title="카드 뒷면의 3자리 숫자">
                </c:when>
                <c:when test="${'paper' eq kind}">
                    <p>가상계좌 발급드립니다. 명일 AM 11:59 까지 입금 바라며 입금이 안될시 자동 취소됩니다.</p>
                    <p>가상계좌 : <c:out value="${virtualAccountNumber}" /></p>
                </c:when>
                <c:when test="${'phonePay' eq kind}">
                    <!-- 구매자 이름, 구매할 제품명, 금액, 전화번호 -->
                    <br><br>
                    이 름 : ${purchaseName }<br>
                    제품명 : ${productNames}<br>
                    휴대폰 번호를 입력해주세요<br>
                    <input type="number" name="Num1" class="phonePayNum" maxlength="3">&nbsp;-
                    <input type="number" name="Num2" class="phonePayNum" maxlength="4">&nbsp;-
                    <input type="number" name="Num3" class="phonePayNum" maxlength="4"><br>
                </c:when>
            </c:choose>
            <br>
            <c:forEach items="${saleCounts}" var="saleCount" varStatus="status">
			    <input type="hidden" name="saleCounts" value="${saleCount}">
			</c:forEach>
			<c:forEach items="${productCodes}" var="productCode" varStatus="status">
			    <input type="hidden" name="productCodes" value="${productCode}">
			</c:forEach>
            <input type="hidden" name="kind" value="${kind}">
            <input type="hidden" name="id" value="${id}">
            <input type="hidden" name="password" value="${password}">
            <input type="hidden" name="type" value="autoUpdate">
            <div id="paybutton">
                결제 금액 : ₩&nbsp;<fmt:formatNumber type="number" value="${total}" pattern="#,###" /><br><br>
                <input type="submit" value="확인">
                <input type="button" value="취소" onclick="main_go()">
            </div>
        </fieldset>
    </form>
</body>
<%@ include file="../img/footer.jspf" %>
</html>
