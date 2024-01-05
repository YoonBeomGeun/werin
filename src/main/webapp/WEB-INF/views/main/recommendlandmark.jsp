<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>ㅣ
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${hotshop}" var="vo">
	<div class="recommendlandmark-image">${vo.landmarkinfo_img}</div>
</c:forEach>