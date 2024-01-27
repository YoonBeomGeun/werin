<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Landmark Information</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #ffffff;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	max-width: 1200px;
	display: flex; /* Flexbox를 사용하여 아이템을 가로 중앙에 배치 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	margin: 20px auto; /* 위아래 여백을 조절하여 세로 중앙 배치를 위한 방법 */
	flex-wrap: wrap; /* 필요하다면 요소들을 여러 줄에 걸쳐 표시할 수 있도록 함 */
}

.landmark {
	box-shadow: 0 0 10px #fbb012;
	margin: 10px;
	padding: 10px;
	text-align: left;
	width: 1000px; /* 예시로 너비를 설정 */
}

img {
	max-width: 100%;
	height: 100%;
	object-fit: cover;
}

hr {
	margin: 20px 0;
	border: 0;
	border-top: 1px solid #ddd;
}

.info-table {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 10px;
	border-collapse: collapse;
	width: 100%;
}

.info-table p {
	margin: 5px 0;
	box-shadow: 0 0 5px #fbb012;
	padding: 8px;
}
</style>

<%@ include file="../../../header.jsp"%>
</head>
<body>
	<h1 align="center" style="color: orange;">제주도의 관광지를 만나보세요!</h1>
	<div class="container">
		<c:forEach var="landmark" items="${list2}">
			<div class="landmark">
				<h2 style="text-align: center;">${landmark.title}</h3>
					<div style="text-align: center;">
						<c:choose>
							<c:when test="${not empty landmark.firstImage2}">
								<object data="${landmark.firstImage2}" type="image/jpg"
									width="400" height="300">
									<!-- firstImage2가 있을 경우 이미지 표시 -->
								</object>
							</c:when>
							<c:otherwise>
								<!-- firstImage2가 없을 경우 대체 이미지 표시 -->
								<img src="${pageContext.request.contextPath}/resources/img/로고.png" alt="대체 이미지" width="400"
									height="300">
							</c:otherwise>
						</c:choose>
					</div>

					<!-- 주소, 홈페이지, 전화번호를 테이블로 표시 -->
					<div class="info-table">
						<p>
							<strong>주소:</strong> ${landmark.addr1}
						</p>
						<p>
							<strong>홈페이지:</strong> ${landmark.homepage}
						</p>
					</div>
					<p class="overview">${landmark.overview}</p>
			</div>
		</c:forEach>
	</div>

	<hr>
	불러오기 성공
</body>
</html>
