<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 목록 보여주기</title>
<style>
table {
	border-collapse: collapse;
	width: 1000px;
	height: 300px;
}

#table {
	display: flex;
	justify-content: center;
}

body {
	text-align: center;
}

#top {
	padding: 10px;
	background-color: #FBB012;
}


#make {
	background: #FBB012;
	text-align: center;
	width: 120px;
	height: 40px;
	font: 15px 궁서 bold;
	color : white;
	border-radius: 10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<%@ include file="../../../header.jsp"%>

	<div id="planList">
		<div>
			<!-- "나의 일정 모아보기" 제목과 "일정 만들기" 버튼을 포함한 헤더 -->
			<h1 style="display: inline-block;">나의 일정 모아보기</h1>
			<div style="text-align:center;">
				<button id="make">
					<a href="${pageContext.request.contextPath}/plan/plan.jsp">일정
						만들기</a>
				</button>
				</div>
		</div>
		<div id="table">
			<table border="1">
				<thead>
					<tr>
						<th id="top">제목</th>
						<th id="top">여행날짜</th>
						<th id="top">누구랑</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여행게시글 목록을 반복하고 각 행을 표시 -->
					<c:forEach items="${planList}" var="plan">
						<!-- 수정된 부분 -->
						<tr>
							<td>${plan.plan_title}</td>
							<td>${plan.plan_start_date}~${plan.plan_start_date}</td>
							<td>${plan.plan_with}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>