<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!-- 얘는 완성됨 -->
<c:forEach items="${hottravel}" var = "vo">
	<div class="hottravel-image1">${vo.trip_img}</div>
	<div class="hottravel-text1">${vo.trip_title}</div>
</c:forEach>

<!-- 얘도 완성됨 -->