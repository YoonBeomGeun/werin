<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<!-- 얘는 완성됨 -->
<c:forEach items="${hottravel}" var = "vo">
	
	<div class="show_hottravel">
	<div id="hottravel-image">
	<a href="../trip/one?trip_id=${vo.trip_id}">${vo.trip_img}</a>
	</div>
	
	<div id="hottravel-text">
	<a href="../trip/one?trip_id=${vo.trip_id}">${vo.trip_title}</a>
	</div>
	</div>
	
</c:forEach>

<!-- 얘도 완성됨 -->