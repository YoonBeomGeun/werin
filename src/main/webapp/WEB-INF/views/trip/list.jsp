<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여행게시글 목록</title>
<%@ include file="../../../header.jsp"%>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	max-width: 800px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h3 {
	color: #3498db;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #3498db;
	color: #fff;
}

tr:hover {
	background-color: #f5f5f5;
}

a {
	text-decoration: none;
	color: #3498db;
}

button {
	background-color: #3498db;
	color: #fff;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	cursor: pointer;
	margin-top: 20px;
}

button:hover {
	background-color: #2980b9;
}
</style>
</head>
<body>
	<div class="container">
		<h3>여행게시글 목록</h3>
		<table>
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
					<th>추천</th>
				</tr>
			</thead>
			<tbody>
				<!-- 여행게시글 목록을 반복하고 각 행을 표시 -->
				<c:forEach items="${list}" var="post">
					<tr>
						<td><a href="one?trip_id=${post.trip_id}">${post.trip_title}</a></td>
						<td>${post.trip_writer}</td>
						<td>${post.trip_writedate}</td>
						<td>${post.trip_count}</td>
						<td>${post.trip_total_like}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:choose>
    <c:when test="${empty loginId}">
        <!-- 로그인 되어 있지 않은 경우 -->
        <p> 여행기 작성은 로그인이 필요합니다. </p>
       <!--  <button onclick="window.location.href='../member/login.jsp'">로그인</button> -->
    </c:when>
    <c:otherwise>
        <!-- 로그인 되어 있는 경우 -->
        <button onclick="window.location.href='../trip/tripwrite.jsp'">게시글 작성</button>
    </c:otherwise>
</c:choose>

		<div class="paging">

			<%
				int pages = (int) request.getAttribute("pages");
			if (pages == 0) {
			%>
			작성된 여행기가 없습니다.
			<%
				} else {
			for (int i = 1; i <= pages; i++) {
			%>
			<a href="list?pages=<%=i%>"><button class="pages"><%=i%></button></a>
			<%
				}
			}
			%>


		</div>
	</div>
</body>
</html>
