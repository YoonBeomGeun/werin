<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<td>자유게시판 제목</td>
		</tr>
		<c:forEach items="${searchbbs}" var="vo">
			<tr>
				<td>${vo.row_no}</td>
				<td>${vo.bbs_id}</td>
				<td>${vo.bbs_title}</td>
			</tr>
		</c:forEach>
	</table>

<%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>
	<a href="morebbs?searching=${searching}&page=<%= p %>">
		<button style="background: pink;"><%= p %></button>
	</a>
<%		
	}
%>

<%-- <%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
		if(p==1){
%>
	<!-- 여기 링크수정해야함 -->
	<a href="search?searching=${searching}">
		<button style="background: pink;"><%= p %></button>
	</a>
<%
		}else{
%>
	<a href="searchbbs?searching=${searching}?page=<%= p %>">
		<button style="background: pink;"><%= p %></button>
	</a>
<%	
		}
	}
%> --%>
</body>
</html>