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
				<a href="${pageContext.request.contextPath}/main/main.jsp"><img
					src="${pageContext.request.contextPath}/resources/img/로고.png"></a>
			</div>
			<div class="title">
				<a href="${pageContext.request.contextPath}/main/main.jsp"><img
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
							<div id="user_info">${sessionScope.nickname}님 어서오세요!<br>회원등급: ${sessionScope.grade}</div>
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
		<%-- <div class="menubar">
			<a href="${pageContext.request.contextPath}/landmark/landmarkinfo_index1.jsp"><button id="menu">관광지 소개</button></a>
			<a href="${pageContext.request.contextPath}/plan/plan.jsp"><button id="menu">일정 만들기</button></a>
			<a href="${pageContext.request.contextPath}/trip/list?page=1"><button id="menu">여행기 작성</button></a>
			<a href="${pageContext.request.contextPath}/gowith/gowith.jsp"><button id="menu">커뮤니티</button></a>
			<a href=""><button id="menu">나의 여행</button></a>
			<a href=""><button id="menu">공지 / 건의</button></a>
		</div> --%>
		<ul class="menubar">
	      <li>
	        <a href="${pageContext.request.contextPath}/landmark/landmarkinfo_index1.jsp">관광지 소개</a>
	      </li>
	      <li class="community">
	        <a href="">여행 일정</a>
	        <ul class="menu">
	        	<c:choose>
					<c:when test="${empty sessionScope.loginId}">
						<!-- 로그인 되어 있지 않은 경우 -->
						<li><a onclick="alert('로그인이 필요합니다.'); window.location.href='${pageContext.request.contextPath}/member/login.jsp'" style="cursor: pointer;">일정 만들기</a></li>
	          			<li><a href="${pageContext.request.contextPath}/plan/planalllist">일정 둘러보기</a></li>
					</c:when>
					<c:otherwise>
						<!-- 로그인 되어 있는 경우 -->
						<li><a href="${pageContext.request.contextPath}/plan/plan.jsp">일정 만들기</a></li>
	          			<li><a href="${pageContext.request.contextPath}/plan/planalllist">일정 둘러보기</a></li>
					</c:otherwise>
				</c:choose>
	        </ul>
	      </li>
	      <li>
	        <a href="${pageContext.request.contextPath}/trip/list?page=1">여행기 보기</a>
	      </li>
	      <li>
	        <a href="${pageContext.request.contextPath}/gowith/list1?page=1">동행게시판</a>
	      </li>
	      <li>
	        <a href="${pageContext.request.contextPath}/bbs/bbs?page=1">자유게시판</a>
	      </li>
	      <li>
	        <a href="${pageContext.request.contextPath}/plan/planlist">나의 일정</a>
	      </li>
	    </ul>
	</header>
	
	
</body>
</html>