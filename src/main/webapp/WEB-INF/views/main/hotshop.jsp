<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<c:forEach items="${hotshop}" var="vo">
	<div class="hotshop-image">
	<a href="">${vo.introducestore_img}</a>
	</div>
	<div class="hotshop-text">
	<a href="">${vo.introducestore_title}</a>
	</div>
</c:forEach>

<!-- 얘도 완성됨 -->