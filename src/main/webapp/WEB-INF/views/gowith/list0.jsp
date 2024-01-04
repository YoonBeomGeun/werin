<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="vo">
	<a href="one?gowith_id=${vo.gowith_id}">
		<div class="content">
			${vo.gowith_writer}<br>
			${vo.gowith_title}<br>
			${vo.gowith_content}<br>
			여행일 수<br>
			${vo.gowith_like}, ${vo.gowith_view}
		</div>
	</a>
</c:forEach>
