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

<%-- <C:IF TEST = "${RESULT == 0}"> --%>
<c:if test="${result == 0}">
<div class="search_landmark"> <!-- 관광지 검색 결과 -->
<c:forEach items="${searchlandmark}" var="vo">
<a href=""></a><br> <!-- 여기에 링크 연결해야함 -->
</c:forEach>
</div>

<div class="search_trip"> <!-- 여행기 검색 결과 -->
<c:forEach items="${searchtrip}" var="vo">
<a href=""></a><br> <!-- 여기에 링크 연결해야함 -->
</c:forEach>
</div>

<div class="search_bbs"> <!-- 자유게시판 검색 결과 -->
<c:forEach items="${searchbbs}" var="vo">
<a href=""></a><br> <!-- 여기에 링크 연결해야함 -->
</c:forEach>
</div>
</c:if>
<c:if test="${result == 1}">
검색 결과가 없습니다
</c:if>
</body>
</html>