<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<%-- 이 아래부분은 css부분이라 수정하는게 좋을듯<br>
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
	</table> --%>

 	<div id=search_info>
		<c:forEach items="${searchbbs}" var="vo">
		<div id=search_loop>		
		<a href="../bbs/bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a><br>
		<a href="../bbs/bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_content}</a>		
		</div>
		</c:forEach>
	</div>

<div class="number_button">
<%
	int pages = (int)request.getAttribute("pages");
	for(int p = 1; p <= pages; p++){
%>
	<a href="morebbs?searching=${searching}&page=<%= p %>">
		<button id="number"><%= p %></button>
	</a>
<%		
	}
%>
</div>
<div id="blank">
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