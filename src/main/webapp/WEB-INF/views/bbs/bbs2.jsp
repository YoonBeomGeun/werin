<%@page import="com.multi.werin.bbs.BbsDAO"%>
<%@page import="com.multi.werin.bbs.BbscmtDAO"%>
<%@page import="com.multi.werin.bbs.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bag" class="com.multi.werin.bbs.BbsVO"></jsp:useBean>
    <jsp:setProperty property="id" name="bag"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
			<tr class="table-success">
				<td>제목</td>
				<td><%= bag.getTitle() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%= bag.getContent() %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%= bag.getWriter() %></td>
			</tr>
			
		</table>
		<button class="btn btn-warning">추천하기<%= bag.getBbs_like() %></button>
</body>
</html>