<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${recommendlandmark}" var="vo">
	<div class="recommendlandmark-image">${vo.landmarkinfo_pic}</div>
</c:forEach>