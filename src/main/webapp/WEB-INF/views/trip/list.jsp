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
    background-color: #ffffff;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border: none;
}

h3 {
    color: #000000;
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
    background-color: #fbb012;
    color: #fff;
}

a {
    text-decoration: none;
    color: #000000; /* 링크의 기본 색상 변경 */
}

a:hover {
    color: #d18000; /* 호버 시 링크 색상 변경 */
}

button {
    background-color: #fbb012;
    color: #fff;
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    margin-top: 20px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #e19400; /* 호버 시 배경 색상 변경 */
}

body, .container, h3, table, th, td, a, button {
    white-space: nowrap;
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
        ${loginId}
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
			<a href="list?page=<%=i%>"><button class="pages"><%=i%></button></a>
			<%
				}
			}
			%>


		</div>
	</div>
</body>
</html>
