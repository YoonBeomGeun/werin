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
	justify-content: center;
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

#prevGroup, #nextGroup {
	background: lightblue;
	padding: 8px 12px;
	font-size: 16px;
	margin: 4px;
}

.pages {
	background: pink;
	padding: 8px 12px;
	font-size: 16px;
	margin: 4px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
	$(function() {

		var pages = <%=(int) request.getAttribute("pages")%>; // 전체 페이지 수
		var buttonsPerPage = 5; // 한 그룹당 표시될 버튼 수
		var totalGroups = Math.ceil(pages / buttonsPerPage); // 전체 그룹 수
		var currentGroup = 1; // 현재 그룹

		function updatePaginationButtons() {
			$('.pages').hide(); // 모든 버튼 숨기기

			var startButton = (currentGroup - 1) * buttonsPerPage + 1;
			var endButton = Math.min(currentGroup * buttonsPerPage, pages);

			for (var i = startButton; i <= endButton; i++) {
				$('.pages').eq(i - 1).show();
			}
		}

		$('.pages').click(function() {
			var pageNumber = $(this).text();

			$.ajax({
				url: "jejulistpaging2",
				data: {
					page: pageNumber
				},
				success: function(x) {
					console.log(x);
					$(".container").html(x);
				}
			});
		});

		$('#prevGroup').click(function() {
			currentGroup = Math.max(1, currentGroup - 1);
			updatePaginationButtons();
		});

		$('#nextGroup').click(function() {
			currentGroup = Math.min(totalGroups, currentGroup + 1);
			updatePaginationButtons();
		});

		updatePaginationButtons();

	});
</script>

</head>
<body>
	<h2>랜드마크 정보</h2>
	<hr>
	<div class="container">
		<!-- 목록을 반복하며 각 랜드마크를 표시합니다. -->
		<c:forEach var="landmark" items="${list}" varStatus="loop">
			<c:if test="${loop.index < 10}">
				<div class="landmark">
					<div class="landmark-title">${landmark.landmarkinfo_name}</div>
					<div class="landmark-image">
						<c:if test="${not empty landmark.landmarkinfo_pic}">
							<a
								href="<c:url value='/jejupage?landmarkName=${landmark.landmarkinfo_name}'/>">
								<img src="${landmark.landmarkinfo_pic}" alt="랜드마크 이미지">
							</a>
						</c:if>
						<c:if test="${empty landmark.landmarkinfo_pic}">
							<a
								href="<c:url value='/jejupage?landmarkName=${landmark.landmarkinfo_name}'/>">
								<img src="${pageContext.request.contextPath}/resources/img/로고.png" alt="대체 이미지">
							</a>
						</c:if>
					</div>

				</div>
			</c:if>
		</c:forEach>

	</div>

	<button id="prevGroup" style="background: lightblue;">이전</button>

	<%
		int pages = (int) request.getAttribute("pages");
	for (int p = 1; p <= pages; p++) {
	%>
	<button style="background: pink;" class="pages"><%=p%></button>
	<%
		}
	%>

	<button id="nextGroup" style="background: lightblue;">다음</button>


	<hr>
	불러오기 성공
</body>
</html>