<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/header.css">
<title>Insert title here</title>
</head>
<body>
<header>
        <div class="all">
        	<div class="logo">
  <a href=""><img src="resources/img/로고.png"></a>
</div>
<div class="title">
  <a href=""><img src="resources/img/제목.png"></a>
</div>
            <div class="right">
            	<div>
            		<button class="lens">
            			<img src="resources/img/돋보기2.png">
            		</button>
            	</div>
            	<div class="but">
            		<button onclick="member()">회원가입</button>
            		<button>로그인</button>
            	</div>
            </div>
        </div>
    <br>
	<div class="menubar">
	<a href=""><button class="btn btn-warning" id="menu">관광지 소개</button></a>
	<a href=""><button class="btn btn-warning" id="menu">일정 만들기</button></a>
	<a href="trip/list"><button class="btn btn-warning" id="menu">여행기 작성</button></a>
	<a href=""><button class="btn btn-warning" id="menu">커뮤니티</button></a>
	<a href=""><button class="btn btn-warning" id="menu">나의 여행</button></a>
	<a href=""><button class="btn btn-warning" id="menu">공지 / 건의</button></a>
</div>
    </header>
    
    <script>
    	function member() {
    		alert("실행..........");
    	}
    </script>
</div>
</body>
</html>