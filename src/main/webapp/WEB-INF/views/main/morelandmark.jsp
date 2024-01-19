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
			<td>관광지이름</td>
			<td>관광지설명</td>
		</tr>
		<c:forEach items="${searchlandmark}" var="vo">
			<tr>
				<td>${vo.row_no}</td>
				<td>${vo.landmarkinfo_id}</td>
				<td>${vo.landmarkinfo_name}</td>
				<td>${vo.landmarkinfo_info}</td>
			</tr>
		</c:forEach>
	</table>
	
<div class="number_button">
<%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>
	<a href="morelandmark?searching=${searching}&page=<%= p %>">
		<button style="background: pink;"><%= p %></button>
	</a>
<%		
	}
%>
</div>
</body>
</html>