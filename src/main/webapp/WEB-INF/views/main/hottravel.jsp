<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<!-- 얘는 완성됨 -->
<c:forEach items="${hottravel}" var = "vo">
	<div class="hottravel-image1">
	<a href="gowith/trip/one?trip_id=${vo.trip_id}">${vo.trip_img}</a>
	</div>
	<div class="hottravel-text1">
	<a href="gowith/trip/one?trip_id=${vo.trip_id}">${vo.trip_title}</a>
	</div>
</c:forEach>

<!-- 얘도 완성됨 -->