<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>고객센터</title>

	<!-- 
  <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico">
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="./css/style.css">
   -->
  <style>
    /* 초기화 */
    * {
      margin: 0;
      padding: 0;
    }

    ul, ol {
      list-style: none;
    }

    a {
      text-decoration: none;
      color: #111;
    }

    #wrapper {
      width: 100%;
    }

    /* 헤더 */
    header {
      width: 100%;
      height: auto;
    }

    header > div {
      width: 100%;
      box-sizing: border-box;
    }

    header > .top {
      height: 35px;
      border-bottom: 1px solid #e9e9e9;
    }

    header > .top > div {
      width: 1200px;
      height: 100%;
      margin: 0 auto;
    }

    header > .top > div > p {
      float: right;
      margin-top: 8px;
    }

    header > .top > div > p > a {
      font-size: 12px;
      color: #555;
      margin-right: 10px;
    }

    header > .top > div a:hover {
      color: #333;
      border-bottom: 1px solid #555;
    }

    header > .logo {
      height: 115px;
      border-bottom: 1px solid #e9e9e9;
    }

    header > .logo > div {
      position: relative;
      width: 1200px;
      height: 100%;
      margin: 0 auto;
    }

    header > .logo > div > a {
      display: inline-block;
      margin-top: 30px;
    }

    header > .logo img {
      vertical-align: bottom;
      margin-right: 10px;
    }

    header > .logo a {
      font-size: 30px;
      font-weight: bold;
    }

    /* 메인 */
    #cs {
      width: 100%;
      height: auto;
    }

    #cs > .main {
      width: 100%;
      height: auto;
    }

    #cs > .main > .title {
      font-size: 56px;
      text-align: center;
      margin: 60px 0;
      color: #222;
    }

    #cs > .main > .title > strong {
      font-size: 56px;
      color: #45ad4a;
    }

    #cs > .main > section {
      width: 1200px;
      height: auto;
      margin: 0 auto;
      margin-top: 36px;
      border-top: 1px solid #e9e9e9;
      padding-top: 10px;
      box-sizing: border-box;
    }

    #cs > .main > section > h1 {
      font-size: 22px;
      font-weight: bold;
    }

    #cs > .main > section > h1 > a {
      float: right;
      font-size: 14px;
      margin-top: 6px;
      color: #555;
    }

    #cs > .main > section > h1 > a::after {
      display: inline-block;
      width: 18px;
      height: 18px;
      content: "";
      /* background: url("../img/cs_sprites.png") no-repeat; */
      background-position: -230px -276px;
      background-size: 750px auto;
      vertical-align: top;
      margin-left: 6px;
    }

    

    #cs > .main > section > ul > li {
      text-indent: 10px;
      margin-top: 12px;
    }

    #cs > .main > section > ul .title {
      font-size: 18px;
    }

    #cs > .main > section > ul > li > p {
      float: right;
      margin-right: 10px;
    }



    #cs > .main > section > ul .date {
      color: #777;
    }

    #cs > .main > .faq > ul {
      width: 1000px;
      height: auto;
      overflow: hidden;
    }

    #cs > .main > .faq > ul > li {
      width: 100%; /* 가로 너비를 100%로 설정하여 한 줄에 하나씩 표시 */
      text-align: left; /* 텍스트를 왼쪽으로 정렬 */
      margin-bottom: 16px; /* 각 항목 아래에 간격 추가 (선택 사항) */ 
    }

    #cs > .main > .faq > ul > li span {
      display: inline-block;
      font-size: 16px;
      font-weight: bold;
      margin-left: 0px;
      margin-top: 10px;
      color: #000000;
    }

    #cs > .main > .qna > .ask {
      display: inline-block;
      font-size: 16px;
      font-weight: bold;
      margin-left: 10px;
      margin-top: 10px;
      color: #0078ff;
    }

    #cs > .main > .tel {
      overflow: hidden;
    }

    #cs > .main > .tel > article {
      float: left;
      width: 50%;
      height: 300px;
      padding: 16px;
      box-sizing: border-box;
    }

    #cs > .main > .tel > article > div {
      width: 100%;
      height: 100%;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    #cs > .main > .tel > article h3 {
      font-size: 20px;
      font-weight: bold;
      color: #111;
      margin-bottom: 12px;
    }

    #cs > .main > .tel > article p {
      margin-bottom: 16px;
    }

    #cs > .main > .tel > article span {
      font-size: 14px;
    }

    #cs > .main > .tel > article strong {
      font-size: 26px;
      font-weight: bold;
      margin-right: 6px;
    }

    #cs > .main > .tel > article a {
      font-size: 26px;
      font-weight: bold;
      margin-right: 6px;
    }

    /* 푸터 */
    footer {
      width: 100%;
      height: 192px;
      background: #f8f8f8;
      border-top: 1px solid #e9e9e9;
      box-sizing: border-box;
    }

    footer > ul {
      width: 1200px;
      height: 39px;
      margin: 0 auto;
      padding: 15px 0;
      border-bottom: 1px solid #e9e9e9;
      box-sizing: border-box;
      text-align: center;
    }

    footer > ul > li {
      display: inline-block;
      border-right: 1px solid #d7d7d7;
      padding: 0 10px;
    }

    footer > ul > li:first-child {
      border-left: 1px solid #d7d7d7;
    }

    footer > div {
      width: 1200px;
      height: auto;
      margin: 0 auto;
      padding-top: 20px;
      box-sizing: border-box;
    }

    footer p {
      float: left;
      height: 100%;
      font-size: 12px;
      line-height: 18px;
      color: #676767;
    }

    footer p:nth-of-type(2) {
      width: 300px;
      margin-left: 30px;
      margin-right: 30px;
    }

    footer p > strong {
      display: inline-block;
      padding: 6px 15px 7px 0;
      color: #464646;
      font-size: 14px;
      font-weight: bold;
    }
  </style>
</head>
<body>
<div id="wrapper">
  <header>
    <div class="top">
      <div>
        <p>
          <a href="controller?type=myPage">마이페이지</a>
          <a href="cart?type=CartList">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            장바구니
          </a>
        </p>
      </div>
    </div>
    <div class="logo">
      <div>
        <a href="#">
<%--          <img src="./img/logo.png" alt="로고">--%>
          고객센터
        </a>
      </div>
    </div>
  </header>
  <section id="cs">
    <div class="main">
      <h1 class="title">
        <strong><a href="qa?type=MyQAList">내 문의함</a></strong>
      </h1>
      <section class="notice">
        <h1>
          공지사항
          <a href="#">전체보기</a>
        </h1>
        <ul>
          <li>
            <a href="#" class="title">[안내] 해외결제 사칭 문자 주의</a>
            <span class="date">23.10.24</span>
          </li>
          <li>
            <a href="#" class="title">[공지] 위해 상품정보 안내</a>
            <span class="date">23.10.23</span>
          </li>
          <li>
            <a href="#" class="title">[공지] 이용 약관 개정 예정 안내</a>
            <span class="date">23.10.22</span>
          </li>
          <li>
            <a href="#" class="title">[공지] 부적합 대상 상품 정보 안내</a>
            <span class="date">23.10.21</span>
          </li>
          <li>
            <a href="#" class="title">[공지] 상품의 안전에 관한 안내</a>
            <span class="date">23.10.19</span>
          </li>
        </ul>
      </section>
      <section class="faq">
        <h1>
          자주 묻는 질문
          <a href="qa/FAQ.jsp">
            전체보기
          </a>
        </h1>
        <ul>
          <li>
              <a href="#" class="title">배송은 보통 얼마나 걸리나요??</a>
          </li>
          <li>
              <a href="#" class="title">환불 규정에 대해 알고싶어요</a>
          </li>
          <li>
              <a href="#" class="title">아이디와 비밀번호가 기억나지 않아요.</a>
          </li>
          <li>
              <a href="#" class="title">회원 정보 수정은 어디서 하나요?</a>
          </li>
          <li>
              <a href="#" class="title">교환하고 싶어요</a>
          </li>
        </ul> <!-- 변경: <ol>을 <ul>로 변경 -->
      </section>
      <section class="qna">
        <h1>
          1:1 문의하기
          <a href="qa?type=QAWrite">
            작성하기
          </a>
        </h1>

        <ul>

          <li>
            <a href="#" class="title">
              배송문의</a>
          </li>
          <li>
            <a href="#" class="title">
              상품문의</a>
          </li>
          <li>
            <a href="#" class="title">
              환불 문의</a>
          </li>
          <li>
            <a href="#" class="title">
              취소/반품/교환 문의 </a>
          </li>
        </ul>
      </section>
      <section class="tel">
        <h1>1:1 상담이 필요하신가요?</h1>
        <article>
          <div>
            <h3>고객센터 이용안내</h3>
            <p>
              <span>일반회원/비회원</span>
              <br>
              <strong>1566-0001</strong>
              <span>(평일 09:00 ~ 18:00)</span>
            </p>
            <p>
              <span>스마일클럽 전용</span>
              <br>
              <strong>1566-0002</strong>
              <span>(365일 09:00 ~ 18:00)</span>
            </p>
          </div>
        </article>
        <article>
          <div>
            <h3>판매상담 이용안내</h3>
            <p>
              <span>판매고객</span>
              <br>
              <strong>1566-0408</strong>
              <span>(평일 09:00 ~ 18:00)</span>
            </p>
            <p>
              <a href="#">판매자 가입 및 서류 접수 안내 ></a>
            </p>
          </div>
        </article>
      </section>
    </div>
  </section>
  <footer>
    <ul>
      <li>
        <a href="#">회사소개</a>
      </li>
      <li>
        <a href="#">서비스이용약관</a>
      </li>
      <li>
        <a href="#">개인정보처리방침</a>
      </li>
      <li>
        <a href="#">전자금융거래약관</a>
      </li>
    </ul>
    <div>

      <p>
        <strong>(주)FOODCART</strong>
        <br>
        서울 강남구 테헤란로 124(역삼동) 삼원타워 4층
        <br>
        대표이사 : 홍길동
        <br>
        사업자등록번호 : 220-81-83676 사업자정보확인
        <br>
        통신판매업신고 : 강남 10630호 Fax : 02-589-8842
      </p>
      <p>
        <strong>고객센터</strong>
        <br>
        Tel : 1234-5678 (평일 09:00 ~ 18:00)
        <br>
        고객센터 : 1522-0408 (365일 09:00~18:00)
        <br>
        서울 강남구 테헤란로 124(역삼동) 삼원타워 4층
        <br>
        Fax : 051-123-4567 | Mail : foodcart@project.co.kr
        <br>
      </p>
    </div>
  </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>