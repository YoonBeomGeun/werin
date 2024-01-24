<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 한 페이지당 10개의 랜드마크를 반복하며 표시합니다. -->
<c:forEach var="landmark" items="${list}" varStatus="loop">
	<c:if test="${loop.index < 10}">
		<div class="landmark">
			<div class="landmark-title">
				${landmark.landmarkinfo_name}
			</div>
			<div class="landmark-image">
				<c:if test="${not empty landmark.landmarkinfo_pic}">
					<a
						href="<c:url value='/jejupage?landmarkName=${landmark.landmarkinfo_name}'/>">
						<img src="${landmark.landmarkinfo_pic}" alt="랜드마크 이미지">
					</a>
				</c:if>
			</div>
			
		</div>
	</c:if>
</c:forEach>
