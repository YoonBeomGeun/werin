<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Travel Plans</title>
<style>
body {
	text-align: center;
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#main-content {
	width:70%;
    display: inline-block;
    text-align: left;
    border: 1px solid #fbb012; /* 주황색 테두리 */
    padding: 40px; /* 상하좌우 패딩을 40px로 조정 */
    margin: 20px auto; /* 가운데 정렬을 위해 margin 수정 */
    background-color: #fff; /* 흰색 배경 */
    box-shadow: 0 0 10px #fbb012; /* 주황색 그림자 */
}

#main-content h2,
#main-content p {
    text-align: center;
}

#main-content ul {
    list-style-type: none;
    padding: 0;
    text-align: center;
}

#main-content ul li:first-child {
    font-size: 18px; /* 원하는 크기로 조절 */
    font-weight: bold;
}

h2, h3, h4, p, ul {
	margin: 0;
	padding: 0;
}

h2 {
	margin-bottom: 20px;
}

ul {
	list-style-type: none;
}

li {
	margin-bottom: 10px;
}

.alert {
	color: red;
}

</style>
</head>
<body>
	<%@ include file="../../../header.jsp"%>
		<h1 style=" margin-top: 30px;">여행 상세 일정</h1>
	<div id="main-content">

		<!-- 여행 일정이 있는 경우에만 처리 -->
		<c:if test="${not empty plan}">
			<div>
				<h2>일정 제목 : ${plan.plan_title}</h2>
				<p>여행기간 : ${plan.plan_start_date} ~ ${plan.plan_end_date}</p>
				<p>누구와? : ${plan.plan_with}</p>
				<br>
				<br>
				<ul>
					<c:forEach var="schedule" items="${schedules}"
						varStatus="loopStatus">
						<c:set var="day" value="${schedule.schedule_day}" />
						<c:choose>
							<c:when test="${loopStatus.index eq 0}">
								<!-- 첫 번째 아이템에 대한 처리 -->
								<li>${day.substring(0, 1)}일차${day.substring(1)}</li>
							</c:when>
							<c:otherwise>
								<!-- 나머지 아이템에 대한 처리 -->
								<li>${schedule.schedule_title}</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
			</div>
		</c:if>

		<!-- 여행 일정이 없는 경우에 처리 -->
		<c:if test="${empty plan}">
			<p class="alert">No travel plans found.</p>
		</c:if>
	</div>
	<!-- 여행 일정을 서버에서 가져오는 AJAX 호출 -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script>
		// 페이지 로드 후 실행
		$(document)
				.ready(
						function() {
							// AJAX를 통해 서버로부터 여행 일정 정보를 가져옴
							$.ajax({
								type : 'GET',
								url : '../plan/plan_detail', // 실제 서버 URL로 변경 필요
								success : function(response) {
									// 여행 일정 정보를 가져오면 화면에 표시
									displayTravelPlans(response);
								},
								error : function(error) {
									console.error(error);
									alert('여행 일정을 가져오는데 실패했습니다.');
								}
							});

							// 여행 일정을 화면에 표시하는 함수
							function displayTravelPlans(travelPlans) {
								if (travelPlans.length > 0) {
									// 가져온 여행 일정을 화면에 표시
									for (var i = 0; i < travelPlans.length; i++) {
										var plan = travelPlans[i];
										var planDiv = $('<div>');
										planDiv.append('<h3>' + plan.plan_title
												+ '</h3>');
										planDiv
												.append('<p>Start Date: '
														+ plan.plan_start_date
														+ '</p>');
										planDiv.append('<p>End Date: '
												+ plan.plan_end_date + '</p>');
										planDiv.append('<h4>Schedule</h4>');
										var scheduleList = $('<ul>');
										for (var j = 0; j < plan.schedules.length; j++) {
											var schedule = plan.schedules[j];
											scheduleList.append('<li>'
													+ schedule.schedule_title
													+ ' - '
													+ schedule.schedule_day
													+ '</li>');
										}
										planDiv.append(scheduleList);
										planDiv.appendTo('body');
									}
								} else {
									// 여행 일정이 없을 경우 메시지 표시
									$('<p>No travel plans found.</p>')
											.appendTo('body');
								}
							}
						});
	</script>
</body>
</html>
