<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${recommendlandmark}" var="vo">
	<div id="recommendlandmark_image" style=" cursor: pointer;" onclick="location.href='../jejupage?landmarkName=${vo.landmarkinfo_name}';">
	<img src="${vo.landmarkinfo_pic}" alt="Landmark Image">
	</div>
</c:forEach>