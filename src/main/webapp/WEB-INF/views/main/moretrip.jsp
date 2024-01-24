<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../../header.jsp" %>
<title>Insert title here</title>
</head>
<body>

<div id="resultpage_search"> <!-- 검색칸 -->
	<form action="search">
		<input name="searching"> <!-- searching으로 검색내용을 받음 -->
		<button>검색하기</button>
	</form>
</div><br>

<div id="return_searchpage">
	<a href="search?searching=${searching}">${searching} 검색결과 페이지로 돌아가기</a>
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
	
 	<div id=trip_info>
		<c:forEach items="${searchlandmark}" var="vo">
		${vo.trip_title} <br>
		${vo.trip_content}
		</c:forEach>
	</div>

<%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>
	<a href="moretrip?searching=${searching}&page=<%= p %>">
		<button style="background: pink;"><%= p %></button>
	</a>
<%		
	}
%>
</body>
</html>