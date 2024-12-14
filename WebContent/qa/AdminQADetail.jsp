<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 상세 내용</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .qa-info {
            margin-bottom: 20px;
        }

        .qa-info h2 {
            margin: 0;
        }

        .qa-info p {
            margin: 0;
        }

        .qa-content {
            margin: 20px 0;
        }

        .qa-actions {
            text-align: center;
        }

        .qa-actions button {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .answer-form {
            background-color: #f4f4f4;
            padding: 20px;
            margin-top: 20px;
        }

        textarea#answer {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 10px;
        }

        button[type="button"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }

        button[type="button"]:hover {
            background-color: #45a049;
        }

        .text-box {
             ; /* 테두리 스타일 및 색상 설정 */
            padding: 10px; /* 텍스트와 테두리 사이의 간격 설정 */
            width: 100%; /* 박스의 가로 너비 설정 */
            text-align: left; /* 텍스트를 가운데 정렬합니다. */
        }
    </style>
</head>
<body>

<h1>질문 상세 내용</h1>
<div class="container" data-qaId="<%=request.getAttribute("qaId")%>">
    <div class="qa-info">
        <h2>제목: <%=request.getAttribute("title")%></h2>
        <p>작성 날짜: <span>${rDate}</span></p>
    </div>
    <div class="qa-content">
        <p><%=request.getAttribute("content")%></p>
    </div>
    <div class="qa-actions">
        <button onclick="location.href='qa?type=QAModify&qaId=<%=request.getAttribute("qaId")%>'">수정</button>
        <button onclick="location.href='qa?type=QADelete&qaId=<%=request.getAttribute("qaId")%>'">삭제</button>
        <button onclick="location.href='qa?type=QAList'">목록으로 돌아가기</button>
    </div>
</div>
    <c:choose>
        <c:when test="${empty answer}">
    <div class="answer-form">
        <form id="answerForm">
            <textarea id="answer" name="answer" placeholder="답변을 입력하세요"></textarea>
            <input type="hidden" id="qaId" name="qaId" value="${qaId}">
            <input type="hidden" id="productCode" name="productCode" value="${productCode}">
            <input type="hidden" id="category" name="category" value="${category}">
            <button type="button" onclick="submitAnswer()">답변 제출</button>
        </form>
    </div>

        </c:when>
        <c:otherwise>
        
<div class="container">
    <div id="answers" class="text-box">
            ${answer.content}<br>
    </div>
</div>
        </c:otherwise>
    </c:choose>


<script>

    // 호출해서 날짜와 시간을 업데이트
    function submitAnswer() {
        var answerText = document.getElementById('answer').value;
        var qaId = document.getElementById("qaId").value;
        var productCode = document.getElementById("productCode").value;
        var category = document.getElementById("category").value;

        // AJAX 요청 생성
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'qa/AnswerInsert.jsp', true); // 서버 측 엔드포인트 URL 대체
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

        // 요청 데이터에 qaId 추가
        var data = "answer=" + answerText + "&qaId=" + qaId + "&productCode=" + productCode + "&category=" + category;
        xhr.send(data);
        // 요청이 완료되면 실행할 콜백 함수
        xhr.onload = function () {
            if (xhr.status === 200) {
                alert('답변이 성공적으로 제출되었습니다');

                // // 새로운 답변을 생성
                // var formattedDate = formatDateAndTime(); // 위에서 정의한 함수
                // var answerContainer = document.createElement('div');
                // answerContainer.classList.add('answer');
                // answerContainer.innerHTML = '<h2>답변 제목</h2><p>' + answerText + '</p><p class="answer-date">' + formattedDate + '</p>';
                //
                // // 답변을 "answers" 섹션에 추가
                // var answersSection = document.getElementById('answers');
                // answersSection.appendChild(answerContainer);

                // 입력 창 비우기
                document.getElementById('answer').value = '';

                // 답변 입력 칸 숨기기
                document.querySelector('.answer-form').style.display = 'none';

            } else {
                alert('답변 제출 중 오류가 발생했습니다');
                // 오류 시 필요한 추가 작업을 수행
            }
        };
    }




</script>
</body>
</html>

