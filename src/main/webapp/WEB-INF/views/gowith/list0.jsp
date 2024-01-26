<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="vo" varStatus="loop">
	<c:choose>
		<c:when test="${not empty sessionScope.loginId}">
			<a href="one?gowith_id=${vo.gowith_id}">
				<div class="content">
					<span style="font-size: 13px;">작성자 ${vo.gowith_writer}</span><br>
					<span style="font-size: 17px; font-weight: bold;">${vo.gowith_title}</span><br>
					<span style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width:300px;">${vo.gowith_content}</span><br>
					<div style="height: 200px; margin-left: -10px;">
						<img src="${pageContext.request.contextPath}/resources/img/${vo.gowith_img}" alt="이미지 설명" style="width: 103%; height: 100%; object-fit: cover; border-radius: 10px;">
					</div>
					<div class="mit">
						👀 ${vo.gowith_view}&nbsp;&nbsp;&nbsp;❤️ ${vo.gowith_total_like}
					</div>
				</div>
			</a>
		</c:when>
		<c:otherwise>
			<a href="../member/login.jsp" onclick="alert('로그인이 필요합니다.')">
				<div class="content">
					<span style="font-size: 13px;">작성자 ${vo.gowith_writer}</span><br>
					<span style="font-size: 17px; font-weight: bold;">${vo.gowith_title}</span><br>
					<span style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width:300px;">${vo.gowith_content}</span><br>
					<div style="height: 200px; margin-left: -10px;">
						<img src="${pageContext.request.contextPath}/resources/img/${vo.gowith_img}" alt="이미지 설명" style="width: 103%; height: 100%; object-fit: cover; border-radius: 10px;">
					</div>
					<div class="mit">
						👀 ${vo.gowith_view}&nbsp;&nbsp;&nbsp;❤️ ${vo.gowith_total_like}
					</div>
				</div>
			</a>
		</c:otherwise>
	</c:choose>
</c:forEach>