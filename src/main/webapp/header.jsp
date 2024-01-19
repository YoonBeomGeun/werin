<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<title>Insert title here</title>
</head>
<body>
	<header
		class="<c:if test='${not empty sessionScope.loginId}'>logged-in</c:if><c:if test='${empty sessionScope.loginId}'>not-logged-in</c:if>">
		<div class="all">
			<div class="logo">
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/img/로고.png"></a>
			</div>
			<div class="title">
				<a href=""><img
					src="${pageContext.request.contextPath}/resources/img/제목.png"></a>
			</div>
			<div class="right">
				<div class="but">
				sessionScope.loginId : ${sessionScope.loginId}
					<!-- 수정: 로그인 상태에 따라 버튼 동적 변경 -->
					
					<c:choose>
						<c:when test="${empty sessionScope.loginId}">
							<!-- 로그인 되어 있지 않은 경우 -->
							<button onclick="window.location.href='${pageContext.request.contextPath}/member/member.jsp'">회원가입</button>
							<button onclick="window.location.href='${pageContext.request.contextPath}/member/login.jsp'">로그인</button>
						</c:when>
						<c:otherwise>
							<!-- 로그인 되어 있는 경우 -->
							<button onclick="window.location.href='${pageContext.request.contextPath}/member/mypage.jsp'">마이페이지</button>
							<form action="${pageContext.request.contextPath}/member/logout"
								method="post">
								<button type="submit">로그아웃</button>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<br>
		<div class="menubar">
			<a href="${pageContext.request.contextPath}/landmark/landmarkinfo_index1.jsp"><button id="menu">관광지 소개</button></a>
			<a href="${pageContext.request.contextPath}/plan/plan.jsp"><button id="menu">일정 만들기</button></a>
			<a href="${pageContext.request.contextPath}/trip/list?page=1"><button id="menu">여행기 작성</button></a>
			<a href="${pageContext.request.contextPath}/gowith/gowith.jsp"><button id="menu">커뮤니티</button></a>
			<a href=""><button id="menu">나의 여행</button></a>
			<a href=""><button id="menu">공지 / 건의</button></a>
		</div>
	</header>
</body>
</html>