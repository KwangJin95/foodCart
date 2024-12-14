<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
            integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="style.css" />
    <title>FAQ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Muli', sans-serif;
            background-color: #f0f0f0;
        }

        h1 {
            margin: 50px 0 30px;
            text-align: center;
        }

        .faq-container {
            max-width: 600px;
            margin: 0 auto;
        }

        .faq {
            background-color: transparent;
            border: 1px solid #9fa4a8;
            border-radius: 10px;
            margin: 20px 0;
            padding: 30px;
            position: relative;
            overflow: hidden;
            transition: 0.3s ease;
        }

        .faq.active {
            background-color: #fff;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .faq.active::before,
        .faq.active::after {
            content: '\f075';
            font-family: 'Font Awesome 5 Free';
            color: #2ecc71;
            font-size: 7rem;
            position: absolute;
            opacity: 0.2;
            top: 20px;
            left: 20px;
            z-index: 0;
        }

        .faq.active::before {
            color: #3498db;
            top: -10px;
            left: -30px;
            transform: rotateY(180deg);
        }

        .faq-title {
            margin: 0 35px 0 0;
        }

        .faq-text {
            display: none;
            margin: 30px 0 0;
        }

        .faq.active .faq-text {
            display: block;
        }

        .faq-toggle {
            background-color: transparent;
            border: 0;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            padding: 0;
            position: absolute;
            top: 30px;
            right: 30px;
            height: 30px;
            width: 30px;
        }

        .faq-toggle:focus {
            outline: 0;
        }

        .faq-toggle .fa-times {
            display: none;
        }

        .faq.active .faq-toggle .fa-times {
            color: #fff;
            display: block;
        }

        .faq.active .faq-toggle .fa-chevron-down {
            display: none;
        }

        .faq.active .faq-toggle {
            background-color: #9fa4a8;
        }
    </style>
</head>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h1>자주 묻는 질문</h1>
<div class="faq-container">
    <div class="faq">
        <h3 class="faq-title">배송은 보통 얼마나 걸리나요??</h3>

        <p class="faq-text"> 3~5일 정도 소요됩니다. 감사합니다.</p>

        <button class="faq-toggle">
            <i class="fas fa-chevron-down"></i>
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="faq">
        <h3 class="faq-title">환불 규정에 대해 알고싶어요</h3>

        <p class="faq-text">배송이 시작되기 전 취소하는 경우 전액 환불됩니다.
            그러나 배송이 시작된 이후에는 환불 비용 5000원을 제외한 금액만 환불 계좌로 입금됩니다.
            상품을 회수하고 검수하는 과정에서 1~2일 소요되며, 검수가 완료되면 환불처리 됩니다.
            환불은 카드사에 따라 다르나 평균 영업일 기준 5일 소요될 수 있습니다.
        </p>

        <button class="faq-toggle">
            <i class="fas fa-chevron-down"></i>
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="faq">
        <h3 class="faq-title">아이디와 비밀번호가 기억나지 않아요.</h3>

        <p class="faq-text">회원가입시 입력한 휴대전화 번호를 통해 아이디와 비밀번호를 찾으실 수 있습니다.</p>

        <button class="faq-toggle">
            <i class="fas fa-chevron-down"></i>
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="faq">
        <h3 class="faq-title">회원 정보 수정은 어디서 하나요?</h3>

        <p class="faq-text">다음과 같은 경로로 직접 변경 하실 수 있습니다.<br>
            <br>마이페이 >회원정보>수정</p>

        <button class="faq-toggle">
            <i class="fas fa-chevron-down"></i>
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="faq">
        <h3 class="faq-title">교환하고 싶어요</h3>

        <p class="faq-text">교환은 배송 완료 일자 포함 7일 이내의 경우 가능합니다.
        </p>

        <button class="faq-toggle">
            <i class="fas fa-chevron-down"></i>
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="faq">
        <h3 class="faq-title">음식을 이미 뜯었는데 환불 하고싶어요
        </h3>

        <p class="faq-text">죄송하지만 이미 포장이 개봉된 상품은 환불이 불가합니다.
            상품의 문제가 있는경우 무상 교환 처리가 가능합니다.</p>

        <button class="faq-toggle">
            <i class="fas fa-chevron-down"></i>
            <i class="fas fa-times"></i>
        </button>
    </div>
</div>
<script src="script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

</body>
<jsp:include page="../img/footer.jspf"/>
</html>
<script>
const toggles = document.querySelectorAll(".faq-toggle");

toggles.forEach((toggle) => {
toggle.addEventListener("click", () => {
toggle.parentNode.classList.toggle("active");
});
});
</script>
