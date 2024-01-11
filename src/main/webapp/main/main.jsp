<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../header.jsp" %>
<meta charset="UTF-8">
<%-- <%@ include file="../header.jsp" %> --%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
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
		$.ajax({
			url: 'http://api.openweathermap.org/data/2.5/weather?q=jeju&APPID=ddc5dcd1b8ef74ebe5bf8438a715ab1a&units=metric',
			success: function(x){
				console.log(x);
				$('#weather').append(x)
			}
		})
	})
</script>
</head>
<body>
	<div id="recommendlandmark"> <!-- 일단은 한개만 넣어놔서 id를 썻지만 필요시 class로 변경 -->
		관광지 추천
	</div>
	
	<div id="mainserch"> <!-- 검색칸 -->
		<form action="search">
			<input name="searching"> <!-- searching으로 검색내용을 받음 -->
			<button>검색하기</button>
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
	날씨정보
	</div>
</body>
</html>

<!-- dbProperties 수정해야함
mybatis 맞는지 확인해볼것
 -->