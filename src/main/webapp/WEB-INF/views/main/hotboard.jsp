<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${hotshop}" var="vo">
	<div class="hotboard-text">${vo.bbs_title}</div>
</c:forEach>