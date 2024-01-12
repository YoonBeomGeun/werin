<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="vo" varStatus="loop">
	<c:choose>
		<c:when test="${not empty sessionScope.loginId}">
			<a href="one?gowith_id=${vo.gowith_id}">
				<div class="content">
					작성자 ${vo.gowith_writer}<br>
					<p style="font-size: 20px;">${vo.gowith_title}</p><br>
					<p>${vo.gowith_content}</p><br>
					<div class="mit">
						여행일 수<br>
						좋아요 ${vo.gowith_like}<br>
						조회수 ${vo.gowith_view}
					</div>
				</div>
			</a>
		</c:when>
		<c:otherwise>
			<a href="../member/login.jsp" onclick="alert('로그인이 필요합니다.')">
				<div class="content">
					작성자 ${vo.gowith_writer}<br>
					<p style="font-size: 20px;">${vo.gowith_title}</p><br>
					<p>${vo.gowith_content}</p><br>
					<div class="mit">
						여행일 수<br>
						좋아요 ${vo.gowith_like}<br>
						조회수 ${vo.gowith_view}
					</div>
				</div>
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>