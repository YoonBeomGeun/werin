<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랜드마크 정보</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	display: flex;
	flex-wrap: wrap;
}

.landmark {
	width: 300px;
	margin: 10px;
	padding: 10px;
	border: 1px solid #dddddd;
	box-sizing: border-box;
}

.landmark img {
	max-width: 100%;
	height: auto;
}

.landmark-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;
}

.landmark-content-id {
	color: #555;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
	$(function() {

		$('.pages').click(function() { // api java로 불러서 db에 집어넣고 결과 표시
			var pageNumber = $(this).text(); // 클릭된 버튼의 텍스트(페이지 번호) 가져오기

			$.ajax({
				url : "jejulistpaging",
				data : {
					page : pageNumber
				}, // 페이지 번호를 서버로 전달
				success : function(x) {
					console.log(x);
					$(".container").html(x);
				} // success
			}); // ajax
		}); // b1

	});
</script>

</head>
<body>
	<h2>랜드마크 정보</h2>
	<hr>
	<div class="container">
		<!-- 목록을 반복하며 각 랜드마크를 표시합니다. -->
		<c:forEach var="landmark" items="${list}" varStatus="loop">
				<div class="landmark">
					<div class="landmark-title">
						${landmark.landmarkinfo_name}
					</div>
					<div class="landmark-image">
						<c:if test="${not empty landmark.landmarkinfo_pic}">
							<a
								href="<c:url value='/jejupage?landmarkName=${landmark.landmarkinfo_name}'/>">
								<img src="${landmark.landmarkinfo_pic}" alt="랜드마크 이미지">
							</a>
						</c:if>
					</div>
					
				</div>
		</c:forEach>
	</div>

	<hr>
	불러오기 성공
</body>
</html>