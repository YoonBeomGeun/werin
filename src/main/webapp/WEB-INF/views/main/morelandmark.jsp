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

<%--  	<table>
		<tr>
			<td>관광지이름</td>
			<td>관광지설명</td>
		</tr>
		<c:forEach items="${searchlandmark}" var="vo">
			<tr>
				<td>${vo.landmarkinfo_name}</td>
				<td>${vo.landmarkinfo_info}</td>
			</tr>
		</c:forEach>
	</table> --%>
	
  	<div id=search_info>
		<c:forEach items="${searchlandmark}" var="vo">
		  	<div id=search_loop>
		  	<a href="../jejupage?landmarkName=${vo.landmarkinfo_name}">${vo.landmarkinfo_name} <br></a>
		  	<a href="../jejupage?landmarkName=${vo.landmarkinfo_name}">${vo.overview} <br></a>
  			</div>
		</c:forEach>
	</div>
	
<div class="number_button">
<%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>
	<a href="morelandmark?searching=${searching}&page=<%= p %>">
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