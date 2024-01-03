<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<title>Insert title here</title>
</head>
<body>
<header>
        <div class="all">
        	<div class="logo">
 			 	<a href=""><img src="${pageContext.request.contextPath}/resources/img/로고.png"></a>
			</div>
			<div class="title">
  				<a href=""><img src="${pageContext.request.contextPath}/resources/img/제목.png"></a>
			</div>
            <div class="right">
            	<div>
            		<button class="lens">
            			<img src="${pageContext.request.contextPath}/resources/img/돋보기2.png">
            		</button>
            	</div>
        	</div>
            <div class="right">
            	<div class="but">
            		<button onclick="window.location.href='../member/member.jsp'">회원가입</button>
            		<button onclick="window.location.href='../member/login.jsp'">로그인</button>
            	</div>
            </div>
        </div>
    <br>
	<div class="menubar">
	<a href=""><button id="menu">관광지 소개</button></a>
	<a href="${pageContext.request.contextPath}/plan/plan.jsp"><button id="menu">일정 만들기</button></a>
	<a href=""><button id="menu">여행기 작성</button></a>
	<a href=""><button id="menu">커뮤니티</button></a>
	<a href=""><button id="menu">나의 여행</button></a>
	<a href=""><button id="menu">공지 / 건의</button></a>
</div>
    </header>
    
</div>
</body>
</html>