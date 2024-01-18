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

이 아래부분은 css부분이라 수정하는게 좋을듯<br>
	<table border="1">
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
	</table>

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