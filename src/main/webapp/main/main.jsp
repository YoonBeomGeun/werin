<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#slideshow').slick({
			slidesToShow : 1,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2300,
		});
	});

	$(function() {
		// 핫여행
		$.ajax({
			url : 'hottravel',
			success : function(x) {
				$('.hottravel').append(x);
			}
		});

		// 자유게시판
 		$.ajax({
			url : 'hotboard',
			success : function(x) {
				$('#hotboard').append(x);
			}
		});

		// 날씨 api
		$
				.ajax({
					url : 'http://api.openweathermap.org/data/2.5/weather?q=jeju&APPID=ddc5dcd1b8ef74ebe5bf8438a715ab1a&units=metric',
					dataType : "json",
					type : "GET",
					success : function(x) {
						console.log("현재온도: " + (x.main.temp));
						console.log("현재습도: " + x.main.humidity);
						console.log("날씨: " + x.weather[0].main);
						console.log("상세날씨설명: " + x.weather[0].description);
						console.log("날씨 이미지: " + x.weather[0].icon);
						console.log("바람: " + x.wind.speed);
						console.log("나라: " + x.sys.country);
						console.log("도시이름: " + x.name);
						console.log("구름: " + (x.clouds.all) + "%");
						updateWeatherInfo(x);
					}
				});
	});
	function updateWeatherInfo(weatherData) {
		// 오늘의 제주 날씨 아래에 날씨 정보를 추가
		var weatherInfo = "현재온도: " + weatherData.main.temp + "<br />"
				+ "현재습도: " + weatherData.main.humidity + "<br />" + "날씨: "
				+ weatherData.weather[0].main 
				 + "<br />" + "구름: "
				+ weatherData.clouds.all + "%";

		$('.today').append("<div class='weather-info'>" + weatherInfo + "</div>");
		
		var imgURL = "http://openweathermap.org/img/w/" + weatherData.weather[0].icon + ".png";
        $('.weather-info').append("<img src='" + imgURL + "' alt='Weather Icon' class='weather-icon' />");
	}
</script>
</head>
<body>
	<div id="recommendlandmark">
		<div id="slideshow">
			<!-- 이미지 슬라이드들을 추가 -->
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju1.jpg">
			</div>
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju2.jpg">
			</div>
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju3.jpg">
			</div>
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju4.jpg">
			</div>
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju5.jpg">
			</div>
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju6.jpg">
			</div>
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju7.jpg">
			</div>
			<div class="slide">
				<img class="slide-image"
					src="${pageContext.request.contextPath}/resources/img/jeju8.jpg">
			</div>
		</div>
	</div>

	<div id="mainsearch">
		<!-- 검색칸 -->
		<form action="search">
			<input id="searching" name="searching" type="text"
				placeholder="검색어를 입력하세요">
			<!-- searching으로 검색내용을 받음 -->
			<button id="search_button">검색하기</button>
		</form>
	</div>

	<div class="hottravel">
		<div id="hottravel_title">HOT 여행기</div>
	</div>

	<div id="hotboard">
		HOT 게시글
	</div>
	<div class="today">
		오늘의 제주 날씨
	</div>

<!-- 	<div class="middle">

	</div> -->

	<div id="blank"></div> 
</body>
</html>