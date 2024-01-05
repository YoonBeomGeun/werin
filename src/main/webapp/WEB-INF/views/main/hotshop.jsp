<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<c:forEach items="${hotshop}" var="vo">
	<div class="hotshop-image">${vo.introducestore_img}</div>
	<div class="hotshop-text">${vo.introducestore_title}</div>
</c:forEach>

<!-- 얘도 완성됨 -->