<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        /* 페이지 전체 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        /* 컨테이너 스타일 */
        .container {
            background-color: #fff;
            padding: 50px;
            border-radius: 5px;
            margin: 20px auto;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.2);
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        h1 {
            font-family: 'Nunito', sans-serif;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* 선택 상품 스타일링 */
        input[type="checkbox"] {
            margin: 0;
            padding: 0;
            width: 20px;
            height: 20px;
        }
        /* 수량 변경 버튼 스타일링 */
        .decrease-quantity,
        .increase-quantity {
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 50%; /* 동그라미 모양으로 만듭니다 */
            width: 30px;
            height: 30px;
            cursor: pointer;
            margin: 0 5px;
            font-size: 20px;
        }

        .decrease-quantity:hover,
        .increase-quantity:hover {
            background-color: #45a049;
        }

            /* 버튼 스타일 */
        .green-button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .green-button:hover {
            background-color: #45a049;
        }
        <jsp:include page="../img/footerStyle.jspf"/>
        </style>
</head>
<body>
<!-- 해더 삽입-->
<jsp:include page="../header.jsp"/>
<div class="container">
    <h1>내 장바구니</h1>
    <!-- 전체 선택 -->
    <input type="checkbox" id="selectAll" onclick="checkAll(this);"> 전체 선택
    <table>
        <thead>
        <tr>
            <th>상품 ID</th>
            <th>수량</th>
            <th>상품명</th>
            <th>가격</th>
            <th>삭제</th>
            <th>선택</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="vo" items="${CartList}">
            <tr data-cart-id="${vo.cartId}">
                <td>${vo.cartId}</td>
                <td>
                    <button class="decrease-quantity" data-cart-id="${vo.cartId}">-</button>
                    <span class="quantity" data-cart-id="${vo.cartId}">${vo.cnt}</span>
                    <button class="increase-quantity" data-cart-id="${vo.cartId}">+</button>
                </td>
                <td>${vo.productName}</td>
                <td>${vo.price} 원</td>
                <td><input type="button" value="삭제" onclick="deleteCartItem(${vo.cartId});"></td>
                <td>
                    <input type="checkbox" name="selectedItems" value="${vo.cartId}">
                    <input type="hidden" class="productCode" name="productCode" value="${vo.productCode}" data-cart-id="${vo.cartId}">
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <button class="green-button" onclick="deleteCartItems()">선택된 항목 삭제</button>
    <button class="green-button" onclick="orderForm();">주문하기</button>
    <div id="total">총합: 원</div>
    <form id="orderForm" method="post" action="controller?type=purchase"></form>
</div>
<script>
    function checkAll(source) {
        var checkboxes = document.getElementsByName('selectedItems');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = source.checked;
        }

        calculateTotal();
    }

    function calculateTotal() {
        var checkboxes = document.getElementsByName('selectedItems');
        var total = 0;

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                // Find the corresponding price element and extract the price
                var quantityElement = checkboxes[i].parentNode.parentNode.querySelector('td:nth-child(2)').querySelector('span');
                var priceElement = checkboxes[i].parentNode.parentNode.querySelector('td:nth-child(4)');
                if (priceElement) {
                    total += parseFloat(priceElement.innerText) * parseFloat(quantityElement.innerText);
                }
            }
        }

        // Display the total
        var totalElement = document.getElementById('total');
        if (totalElement) {
            totalElement.innerText = '총합: ' + addCommasToNumber(total) + ' 원';
        }
    }

    function orderForm() {
        var checkboxes = document.getElementsByName('selectedItems');

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                const cartId = checkboxes[i].value;
                const quantityElement = document.querySelector(".quantity[data-cart-id='" + cartId + "']");
                const currentQuantity = parseInt(quantityElement.textContent);
                const productCode = document.querySelector(".productCode[data-cart-id='" + cartId + "']").value;

                const form = document.getElementById("orderForm");

                form.innerHTML = '<input type="hidden" name="type" value="purchase">' +
                    '<input type="hidden" name="productCode" value="' + productCode + '">' +
                    '<input type="hidden" name="cnt" value="' + currentQuantity + '">';

                form.submit();
            }
        }
    }

    function orderSelectedItems() {
        var selectedcartIds = [];
        var checkboxes = document.getElementsByName('selectedItems');

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                selectedcartIds.push(checkboxes[i].value);

                const cartId = checkboxes[i].value;
                const quantityElement = document.querySelector(".quantity[data-cart-id='" + cartId + "']");
                const currentQuantity = parseInt(quantityElement.textContent);
                const productCode = document.querySelector(".productCode[data-cart-id='" + cartId + "']").value;

                // Ajax 요청 생성
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'controller?type=purchase'); // 실제 서블릿 경로로 변경

                // 요청 헤더 설정
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

                // 요청 데이터 설정 (삭제할 상품 ID)
                const data = 'productCode=' + productCode + '&cnt=' + currentQuantity;
                xhr.send(data);

                // Ajax 요청 완료 시
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        // location.href='주문페이지 이동';
                        console.log('success');
                        location.href='product/purchase.jsp';
                    } else {
                        // 실패 시 에러 처리
                        alert('서버 오류');
                    }
                }
            }
        }
        console.log('Selected Cart IDs: ' + selectedcartIds.join(', '));
    }

    // 체크박스 선택 시 총합 표시 이벤트
    document.getElementsByName("selectedItems").forEach(btn =>
        btn.addEventListener('click', function () {
            calculateTotal()
        }
    ));

    // 수량 감소 버튼 클릭 이벤트
    document.querySelectorAll('.decrease-quantity').forEach(button => {
        button.addEventListener('click', function() {
            const cartId = this.getAttribute('data-cart-id');
            const nowQuantity = this.nextElementSibling.innerText;
            if (nowQuantity < 2) {
                alert("한 개 이상의 수량이 필요 합니다.");
                return;
            }
            updateQuantity(cartId, -1);
        });
    });

    // 수량 증가 버튼 클릭 이벤트
    document.querySelectorAll('.increase-quantity').forEach(button => {
        button.addEventListener('click', function() {
            const cartId = this.getAttribute('data-cart-id');
            updateQuantity(cartId, 1);
        });
    });

    // 수량 업데이트 Ajax 함수
    function updateQuantity(cartId, change) {
        // Ajax 요청 생성
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'cart/CartUpdate.jsp'); // 업데이트 서블릿 경로로 변경

        // 요청 헤더 설정
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 요청 데이터 설정
        const data = 'cartId=' + cartId + '&change=' + change;
        xhr.send(data);

        // Ajax 요청 완료 시
        xhr.onload = function() {
            if (xhr.status === 200) {
                // 서버로부터 응답 받은 JSON 파싱
                // const response = JSON.parse(xhr.responseText);
                // if (response.success) {
                    // 성공 시 수량 업데이트
                    const quantityElement = document.querySelector(".quantity[data-cart-id='" + cartId + "']");
                    const currentQuantity = parseInt(quantityElement.textContent);
                    const newQuantity = currentQuantity + change;
                    quantityElement.textContent = newQuantity;

                    // 총합 업데이트
                    calculateTotal();
            } else {
                alert('서버 오류');
            }
        };
    }

    // 장바구니 항목 삭제 Ajax 함수
    function deleteCartItem(cartId) {
        // Ajax 요청 생성
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'cart/CartDelete.jsp'); // 실제 서블릿 경로로 변경

        // 요청 헤더 설정
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // 요청 데이터 설정 (삭제할 상품 ID)
        const data = 'cartId=' + cartId;
        xhr.send(data);

        // Ajax 요청 완료 시
        xhr.onload = function() {
            if (xhr.status === 200) {
                const cartItem = document.querySelector('tr[data-cart-id="' + cartId + '"]');
                if (cartItem) {
                    cartItem.remove();

                    // 총합 업데이트
                    calculateTotal();
                }
            } else {
                // 실패 시 에러 처리
                alert('서버 오류');
            }
        };
    }

    function deleteCartItems() {
        var selectedcartIds = [];
        var checkboxes = document.getElementsByName('selectedItems');

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                selectedcartIds.push(checkboxes[i].value);
                deleteCartItem(checkboxes[i].value);
            }
        }

        console.log('Selected Cart IDs: ' + selectedcartIds.join(', '));
    }
    function addCommasToNumber(number) {
        // 숫자를 문자열로 변환
        number = number.toString();

        // 숫자 문자열을 뒤에서부터 세 자리마다 쉼표를 추가
        var parts = number.split(".");
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        // 소수점이 있는 경우 다시 합치기
        return parts.join(".");
    }

    calculateTotal();
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

</body>
<%@ include file="../img/footer.jspf" %>
</html>