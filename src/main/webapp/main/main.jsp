<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../header.jsp" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript"> /* 뭔가 오류가 생긴다면 jquery 경로랑 이름 확인해볼것 */

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
/* 		$.ajax({
			url: 'hotshop',
			success: function(x){
				$('.hotshop').append(x) 
			}
		}) */
		
		//자유게시판
		$.ajax({
			url: 'hotboard',
			success: function(x){ /* 잘 안되면 alert로 데이터를 가져오는지 확인해보기 */
				$('#hotboard').append(x) 
			}
		})
		
		//날씨 api
		$.ajax({
			url: 'http://api.openweathermap.org/data/2.5/weather?q=jeju&APPID=ddc5dcd1b8ef74ebe5bf8438a715ab1a&units=metric',
			dataType: "json",
			type: "GET",
			success: function(x){
                console.log("현재온도: "+ (x.main.temp));
                console.log("현재습도: "+ x.main.humidity);
                console.log("날씨: "+ x.weather[0].main);
                console.log("상세날씨설명: "+ x.weather[0].description);
                console.log("날씨 이미지: "+ x.weather[0].icon);
                console.log("바람: "+ x.wind.speed);
                console.log("나라: "+ x.sys.country);
                console.log("도시이름: "+ x.name);
                console.log("구름: "+ (x.clouds.all)+"%");
                $('.weather').append("현재온도: "+ (x.main.temp)+"<br />")
                $('.weather').append("현재습도: "+ x.main.humidity+"<br />")
                $('.weather').append("날씨: "+ x.weather[0].main+"<br />")
                $('.weather').append("날씨 이미지: "+ x.weather[0].icon+"<br />")
                $('.weather').append("도시이름: "+ x.name+"<br />")
                $('.weather').append("구름: "+ (x.clouds.all)+"%"+"<br />")
			}
		})
	})
</script>
</head>
<body>
	<div id="recommendlandmark"> <!-- 일단은 한개만 넣어놔서 id를 썻지만 필요시 class로 변경 -->
	
	</div>
	
	<div id="mainsearch"> <!-- 검색칸 -->
		<form action="search">
			<input id="searching" name="searching" type="text" placeholder="검색어 입력"> <!-- searching으로 검색내용을 받음 -->
			<button id="search_button">검색하기</button>
		</form>
	</div>
	
	<div class="hottravel">
	<div id="hottravel_title">
	HOT 여행기
	</div>
	</div>
	
<!-- 	<div class="hotshop">
	착한가게 소개해요	
	</div> -->
	
	<div id="hotboard">
	인기게시글
	<div id="hotboard_title">
	</div>
	</div>
	
	<div class="weather">
	제주도 날씨
		<div class="temp"></div>
		<div class="city"></div>
	</div>
	
	<div id="blank">
	</div>
</body>
</html>
