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

<div id="resultpage_search"> <!-- 검색칸 -->
	<form action="search">
		<input name="searching"> <!-- searching으로 검색내용을 받음 -->
		<button>검색하기</button>
	</form>
</div>

<c:if test="${result == 0}">


<div class="search_result">
${searching}에 대한 검색 결과입니다
</div>

<div class="search_landmark"> <!-- 관광지 검색 결과 -->
<!-- 4개만 가져와서 보여주는거로 -->
<c:forEach begin="0" end="3" items="${searchlandmark}" var="vo">
<div>
<a href="">${vo.landmarkinfo_name}</a><br> <!-- 여기에 링크 연결해야함 -->
</div>
</c:forEach>
</div>
<div class="more_landmark">
<a href="morelandmark?searching=${searching}&page=1">랜드마크 검색결과 더보기</a>
</div>
---------------------------------------------------------<br>

<div class="search_trip"> <!-- 여행기 검색 결과 -->
<!-- 4개만 가져와서 보여주는거로 -->
<c:forEach begin="0" end="3" items="${searchtrip}" var="vo">
<div>
<a href="gowith/trip/one?trip_id=${vo.trip_id}">${vo.trip_title}</a><br> <!-- 여기에 링크 연결해야함 -->
</div>
</c:forEach>
</div>
<div class="more_trip">
<a href="moretrip?searching=${searching}&page=1">여행기 검색결과 더보기</a>
</div>
---------------------------------------------------------<br>
<div class="search_bbs"> <!-- 자유게시판 검색 결과 -->
<c:forEach  begin="0" end="3" items="${searchbbs}" var="vo">
<a href="bbs/bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a><br> <!-- 여기에 링크 연결해야함 -->
</c:forEach>
</div>
<div class="more_bbs">
<a href="morebbs?searching=${searching}&page=1">여행기 검색결과 더보기</a>
</div>


<!-- 복합페이징? 이건 보류(네이버처럼 구현하는거) -->
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

</c:if>

<c:if test="${result == 1}">
${searching}에 대한 검색 결과가 없습니다
</c:if>
<hr color="yellow">

</body>
</html>