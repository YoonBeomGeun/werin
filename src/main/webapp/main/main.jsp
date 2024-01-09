<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../resources/css/main.css">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript"> /* 뭔가 오류가 생긴다면 jquery 경로랑 이름 확인해볼것 */
var xhr = new XMLHttpRequest();
	$(function(){
		
		//관광지추천
		$.ajax({
			url: 'recommendlandmark',
			success: function(x){
				$('#recommendlandmark').append(x) /* 클래스인지 id인지 확인해보기! */
			}
		})
		
		//핫여행
		$.ajax({
			url: 'hottravel',
			success: function(x){
				$('.hottravel').append(x) 
			}
		})
		
		//착한가게소개해요
		$.ajax({
			url: 'hotshop',
			success: function(x){
				$('.hotshop').append(x) 
			}
		})
		
		//자유게시판
		$.ajax({
			url: 'hotboard',
			success: function(x){ /* 잘 안되면 alert로 데이터를 가져오는지 확인해보기 */
				$('#hotboard').append(x) 
			}
		})
		
		//날씨 api
/*  		$.ajax({
			url: 'http://data.jeju.go.kr/rest/JejuLdapsDataService/getForecastPointDataXY',
			data: {
				servicekey : 'aPfEjmyFEWldT%2F6swKYEIBeFnHViz0HDF7F4rZb%2FO4C927BQ5p8c1aI1Ai1G%2B%2BO%2BtcQu%2BFPg1X18vZee4I5RXg%3D%3D',
				baseDate: '20211017',
				baseTime: '0300',
				nx: '53',
				ny: '4',
				hgtLevel: '0',
				pageSize: '1',
				startPage: '1'
			},
			success: function(x){
				alert(x)
			}
		}) */
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
	
	<div id="recommendlandmark"> <!-- 일단은 한개만 넣어놔서 id를 썻지만 필요시 class로 변경 -->
		관광지 추천
	</div>
	
	<div id="mainserch"> <!-- 검색칸 -->
		<form action="search">
			<input name="searching"> <!-- searching으로 검색내용을 받음 -->
		</form>
	</div>
	
	<div class="hottravel">
	HOT 여행기
	</div>
	
	<div class="hotshop">
	착한가게 소개해요	
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