<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/css/main.css">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.6.4.js"></script>
<script type="text/javascript">

	$(function(){
		$.ajax({
			url: 'weather.jsp', //url 연결해야함
			data: {
				key : ,
				
			},
			success: function(x){
				$('#weather') //성공했을때 어떻게 해야할지 결정해야함
			}
		})
	})
</script>
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
            	<div class="but">
            		<button onclick="member()">회원가입</button>
            		<button>로그인</button>
            	</div>
            </div>
        </div>
    <br>
	<div class="menubar">
	<a href=""><button id="menu">관광지 소개</button></a>
	<a href=""><button id="menu">일정 만들기</button></a>
	<a href=""><button id="menu">여행기 작성</button></a>
	<a href=""><button id="menu">커뮤니티</button></a>
	<a href=""><button id="menu">나의 여행</button></a>
	<a href=""><button id="menu">공지 / 건의</button></a>
</div>
    </header>
	<script>
		function member() {
			alert("실행..........");
		}
	</script>
	<div id="recommendlandmark">
		관광지 추천
	</div>
	<div id="mainserch"> <!-- 검색칸 -->
		<form action="search">
			<input name="searching"> <!-- searching으로 검색내용을 받음 -->
		</form>
	</div>
	<div class="hottravel">
	HOT 여행기
		<div class="hottravel-1">
			<div id="hottravel-image1"></div>
			<div id="hottravel-text1"></div>
		</div>
		<div class="hottravel-2">
			<div id="hottravel-image2"></div>
			<div id="hottravel-text2"></div>
		</div>
		<div class="hottravel-3">
			<div id="hottravel-image3"></div>
			<div id="hottravel-text3"></div>
		</div>
		<div class="hottravel-4">
			<div id="hottravel-image4"></div>
			<div id="hottravel-text4"></div>
		</div>
	</div>
	<div class="hotshop">
	착한가게 소개해요
		<div class="hotshop-1">
			<div id="hotshop-image1"></div>
			<div id="hotshop-text1"></div>
		</div>
		<div class="hotshop-2">
			<div id="hotshop-image2"></div>
			<div id="hotshop-text2"></div>
		</div>
		<div class="hotshop-3">
			<div id="hotshop-image3"></div>
			<div id="hotshop-text3"></div>
		</div>
		<div class="hotshop-4">
			<div id="hotshop-image4"></div>
			<div id="hotshop-text4"></div>
		</div>
	</div>
	<div id="hotboard">
	HOT 게시글
	</div>
	<div id="weather">	
	오늘의 제주날씨
	</div>
</body>
</html>

<!-- dbProperties 수정해야함
mybatis 맞는지 확인해볼것
 -->