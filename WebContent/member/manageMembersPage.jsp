<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mystudy.model.vo.*" %>
<%@ page import="com.mystudy.model.dao.*" %>
<%@ page import="com.mystudy.common.*" %>
<!-- ---------------------------------- -->
<!-- 회원정보 수정 결과 메시지 -->
<c:if test="${updateSuccess != null}">
	<script>
		alert("${msg }");
		location.href = "controller?type=manageMembersPage&cPage=1";
	</script>
</c:if>
<!-- 회원정보 삭제 결과 메시지 -->
<c:if test="${deleteSuccess != null}">
	<script>
		alert("${msg }");
		location.href = "controller?type=manageMembersPage&cPage=1";
	</script>
</c:if>
<!-- 회원정보 등록 결과 메시지 -->
<c:if test="${createSuccess != null}">
	<script>
		alert("${msg }");
		location.href = "controller?type=manageMembersPage&cPage=1";
	</script>
</c:if>
<!-- ---------------------------------- -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
	.container {
		width: 100%;
	}
	#line {
		height: 3px;
		border-bottom: 2px solid gray;
	}
	.pinkBtn {
		width: 150px;
		height: 50px;
		font-weight: bold;
		color: white;
		background-color: DarkSalmon;
		border: 0;
		border-radius: 5px;
	}
	.whiteBtn {
		width: 150px;
		height: 50px;
		font-weight: bold;
		color: DarkSalmon;
		background-color: white;
		border: 2px solid DarkSalmon;
		border-radius: 5px;
	}
	.container table {
		width: 100%;
		border-collapse: collapse;
		font-size: 14px;
	}
	.container th {
		border: 1px solid black;
		padding: 1px 10px;
		background-color: Gainsboro;
		text-align: center;
	}
	.container td {
		border: 1px solid black;
		padding: 1px 10px;
	}
	.container .align-left {
		text-align: left;
	}

	/*** 페이지 표시 영역 스타일(시작) ***/	
	.paging {
		list-style: none;
	}
	.paging li {
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 5px 9px;
		border: 1px solid DarkSalmon;
		font-weight: bold;
		color: DarkSalmon;
	}
	.paging .disable {
		border: 1px solid Gainsboro;
		padding: 5px 9px;
		color: Gainsboro;
	}
	.now {
		border: 0;
		background-color: DarkSalmon;
		padding: 5px 9px;
		font-weight: bold;
		color: white;
	}
	span {
		display: inline-block;
	}
	.smallWhiteBtn {
		text-decoration: none;
		border: 2px solid DarkSalmon;
		color: DarkSalmon;
		font-weight: bold;
		border-radius: 5px;
	}
	.smallPinkBtn {
		text-decoration: none;
		border: 0;
		color: white;
		background-color: DarkSalmon;
		font-weight: bold;
		border-radius: 5px;
	}
	#keyword {
		width: 250px;
	}

</style>

<title>회원관리</title>
<style>
 	
<%@ include file="../img/footerStyle.jspf" %>
</style>
<body>
<jsp:include page="../adminPageHeader.jsp"/>

<div class="container mt-4">
		
	<table class="mb-3">
		<div class="text-center">
			<div>
				<span><h4><strong>회원목록</strong></h4></span>
			</div>
		</div>		
		
		<div>
			<span class="float-left">
				<c:choose>
					<c:when test="${idx == 0 || idx == null}">전체보기</c:when>
					<c:when test="${idx == 1}"><strong>아이디</strong>로 검색 완료</c:when>
					<c:when test="${idx == 2}"><strong>이름</strong>으로 검색 완료</c:when>
					<c:when test="${idx == 3}"><strong>핸드폰 번호</strong>로 검색 완료</c:when>
					<c:when test="${idx == 4}"><strong>이메일</strong>로 검색 완료</c:when>
					<c:when test="${idx == 5}"><strong>주소</strong>로 검색 완료</c:when>
					<c:when test="${idx == 6}"><strong>가입일</strong>로 검색 완료</c:when>
				</c:choose>
			</span>
			
			<span class="float-right mr-2">
				<span class="mr-2">
					<select name="idx" id="idx">
						<option value="0">전체보기</option>
						<option value="1">아이디</option>
						<option value="2">이름</option>
						<option value="3">핸드폰 번호</option>
						<option value="4">이메일</option>
						<option value="5">주소</option>
						<option value="6">가입일(입력일 이후)</option>
					</select>
				</span>
				<span class="float-right mr-2">
					<span>
						<input type="text" class="mr-1" name="keyword" id="keyword" value="${keyword }" placeholder="키워드를 입력하세요.">
					</span>
					<span>
						<input type="button" id="getDataBtn" class="smallPinkBtn" value="검색">
					</span>
				</span>
			</span>
		</div>
		
		<br>
		<div id="line" class="mt-3 mb-3"></div>
		
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>핸드폰 번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>가입일</th>
				<th>수정하기</th>
				<th>삭제하기</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty requestScope.list }">
					<tr>
						<td colspan="9">
							<h4>회원 목록이 없습니다.</h4>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="vo" items="${requestScope.list }">
						<tr>
							<td>${vo.id }</td>
							<td>${vo.password }</td>
							<td>${vo.name }</td>
							<td>${vo.phone }</td>
							<td>${vo.email }</td>
							<td>${vo.address}</td>
							<td>${vo.regdate}</td>
							<td class="text-center"><a class="smallWhiteBtn" href="controller?type=updateMemberPage&id=${vo.id }">수정하기</a></td>
							<td class="text-center"><a class="smallWhiteBtn" href="controller?type=deleteMemberPage&id=${vo.id }">삭제하기</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>			
		</tbody>
	</table>
		
	<div class="pagingDiv">
		<div>
			<ol class="paging">
				<%-- [이전으로]에 대한 사용여부 처리 --%>
				<c:if test="${pvo.beginPage == 1 }">
					<li class="disable">&lt;</li>						
				</c:if>
				<c:if test="${pvo.beginPage != 1 }">
					<li><a href="controller?type=manageMembersPage&idx=${idx}&keyword=${keyword }&cPage=${pvo.beginPage - 1 }">&lt;</a></li>
				</c:if>
							
				<%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="now">${pageNo }</li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<a href="controller?type=manageMembersPage&idx=${idx}&keyword=${keyword }&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:if>
				</c:forEach>
								
				<%-- [다음으로]에 대한 사용여부 처리 --%>
				<c:if test="${pvo.endPage >= pvo.totalPage }">
					<li class="disable">&gt;</li>						
				</c:if>
								
				<c:if test="${pvo.endPage < pvo.totalPage }">
					<li><a href="controller?type=manageMembersPage&idx=${idx}&keyword=${keyword }&cPage=${pvo.endPage + 1 }">&gt;</a></li>
				</c:if>
		
			<div class="w-30 float-right">
				<li>
					<input type="button" class="mr-2 pinkBtn" value="회원 등록" onclick="location.href = 'controller?type=createMemberPage';">
				</li>
			</div>
			</ol>
		
		</div>
		<div id="cPage" value="${cPage }"></div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<script>
	
	$().ready(function() {
		$("#getDataBtn").on("click", selectKeyword);
	});

	function selectKeyword() {
		
		let idx     = $("#idx").val();
		let keyword = $("#keyword").val().trim();

		if (idx != "0" && keyword.trim() == "") {
			alert("키워드를 입력하세요.");
			$("#keyword").focus();
			return ;
		}
		// 핸드폰번호 유효값 검증
		// 1. 숫자, - 문자 외 입력한 경우
		if (idx == 3) {
			for (let i = 0; i < keyword.length; i++) {
				if (keyword[i] < "0" || keyword[i] > "9") {
					if (keyword[i] != "-") {
						alert("숫자 또는 - 문자만 입력해야 합니다.\n다시 입력하세요.");
						$("#keyword").focus();
						return ;
					}
				}
			}			
		} 
		// ------------------------------------------------------
		// 가입일 유효값 확인 (길이, - 포함 위치 확인)
		if (idx == "6") {
			if (keyword.length    != 10  ||
				keyword.charAt(4) != "-" ||
			 	keyword.charAt(7) != "-") {
			
					alert("날짜를 YYYY-MM-DD (예 : 2023-10-27) 형태로 입력해주세요.");
					$("#keyword").focus();
					return ;
			}
		}
		// 나머지가 숫자로 입력됐는지 확인
		if (idx == "6") {
			for (let i = 0; i <= 9; i++) {
				if (keyword[i] != "-") {
				
					if (keyword[i]  < "0" || keyword[i]  > "9") {
						alert("날짜를 YYYY-MM-DD (예 : 2023-10-27) 형태로 입력해주세요.");
						$("#keyword").focus();
						return ;
					}
				}
			}
		}
		
		location.href = "controller?type=manageMembersPage&idx=" + idx + "&keyword=" + keyword;
	}
	
	// 새로고침시 
	window.onkeydown = function() {
		var kcode = event.keyCode;
		
		if(kcode == 116)
			location.href = "controller?type=manageMembersPage";
	}
	
</script>
<br><br><br><br>
</body>
<%@ include file="../img/footer.jspf" %>
</html>