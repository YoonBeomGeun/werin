<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<title>Login Page</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<h2>로그인</h2>
		<form id="loginForm" action="loginProcess" method="post">
			<label for="id">ID:</label> <input type="text" id="id"
				name="member_id" required>
			<!-- 변경된 부분 -->

			<label for="pw">Password:</label> <input type="password" id="pw"
				name="member_pw" required>
			<!-- 변경된 부분 -->

			<c:if test="${not empty requestScope.error}">
				<p class="error">${requestScope.error}</p>
			</c:if>

			<c:if test="${state eq 0}">
				<p class="error" id="loginError">아이디 또는 비밀번호가 잘못되었습니다.</p>
			</c:if>

			<button type="submit">로그인</button>
		</form>

		<%-- 사용자가 로그인되어 있는지 확인 --%>
		<c:if test="${not empty sessionScope.loginId}">
			<!-- 사용자가 로그인되어 있음 -->
			<p>환영합니다, ${sessionScope.loginId}님!</p>
			<!-- 로그아웃 버튼 또는 기타 사용자 관련 콘텐츠 추가 -->
			<form action="${pageContext.request.contextPath}/member/logout"
				method="post">
				<button type="submit">로그아웃</button>
			</form>

		</c:if>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="your_script.js"></script>
	<script>
        // state 값이 0이면 alert 메시지를 띄움
        var state = ${state};
        if (state === 0) {
            alert("아이디 또는 비밀번호가 잘못되었습니다.");
        }
    </script>
</body>
</html>