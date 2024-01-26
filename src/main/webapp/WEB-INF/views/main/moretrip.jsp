<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../../header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/moresearch.css">
<title>Insert title here</title>
</head>
<body>

<div id="resultpage_search"> <!-- 검색칸 -->
	<form action="search">
		<input id="searching" name="searching" type="text" placeholder="검색어 입력"> <!-- searching으로 검색내용을 받음 -->
		<button id="search_button">검색하기</button>
	</form>
</div>

<div id="return_searchpage" style=" cursor: pointer;" onclick="location.href='search?searching=${searching}';">
${searching} 검색결과 페이지로 돌아가기
</div>

<%-- 	<table border="1">
		<tr bgcolor="lime">
			<td>행번호</td>
			<td>id</td>
			<td>여행기이름</td>
			<td>여행기내용</td>
		</tr>
		<c:forEach items="${searchtrip}" var="vo">
			<tr>
				<td>${vo.row_no}</td>
				<td>${vo.trip_id}</td>
				<td>${vo.trip_title}</td>
				<td>${vo.trip_content}</td>
			</tr>
		</c:forEach>
	</table> --%>
	
 	<div id=search_info>
		<c:forEach items="${searchtrip}" var="vo">
		<div id=search_loop>		
		<a href="../trip/one?trip_id=${vo.trip_id}">${vo.trip_title}</a><br>
		<a href="../trip/one?trip_id=${vo.trip_id}">${vo.trip_content}</a><br>
		</div>
		</c:forEach>
	</div>

<div class="number_button">
<%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>
	<a href="moretrip?searching=${searching}&page=<%= p %>">
		<button id="number"><%= p %></button>
	</a>
<%		
	}
%>
</div>
<div id="blank">
</div>
</body>
</html>