<%@page import="com.multi.werin.gowith.GowithVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style type="text/css">
	#result a {
		text-decoration: none;
		color:black;
	}

	.paging {
	    display: flex;
	    justify-content: center;
	    margin-top: 20px;
	}
	
	.paging button {
	    background: rgb(251, 176, 18);
	    margin-right: 5px;
	    border-radius: 10px;
	    color: white;
	    width: 30px;
	    height: 25px;
	}
	
	#result {
	  display: flex;
	  flex-wrap: wrap;
	  gap: 50px;
	  width: 1300px;
	  margin: 0 auto;
	  justify-content: center; /* 내부 요소들을 수평으로 가운데 정렬 */
	  align-items: center; /* 내부 요소들을 수직으로 가운데 정렬 */
	}

	.content {
		margin: 10px;
		padding: 10px;
		width: 350px;
		height: 300px;
		border-radius: 10px;
		border: 2px solid #3a8966;
		box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
		overflow: hidden;
	}
	
	.content p {
		margin: 10px 0;
	}
	
	.content mit {
			/* 어떻게 수정해야 할지 모르겠음 */
	}
	
	.bottom {
		background: #285D45;
		height: 80px;
		margin-top: 30px;
	}
</style>


<script type="text/javascript">

	$(function() {
		$(".pages").click(function() {
			$.ajax({
				url: "list0",
				data: {
					page: $(this).text()
				},
				success: function(table) {
					$("#result").html(table)
				}
			})
		})
	})
</script>
</head>

<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<h1 style="text-align:center; color:rgb(251, 176, 18);">동행게시판<br><span style="text-align:center; color:rgb(251, 176, 18);font-size: 25px;">마음이 맞는 분과 함께 여행을 떠나봐요! </span></h1>
	<!-- <div style="text-align: center;"><input type="text" value="검색어를 입력하세요."></div> -->
	<!-- <div style="margin-left: 19%;">
		<button>최신순</button>
		<button>추천순</button>
		<button>조회순</button>
	</div> -->
	<div style="margin-bottom:35px;">
		<c:choose>
		    <c:when test="${not empty sessionScope.loginId}">
		        <a href="insertGowith.jsp">
		            <button style="position: absolute; right: 350px; margin:auto; background:#3a8966; text-align:center; color:white; width:75px; height:50px; border-radius:10px; font-size: 17px;">글쓰기</button>
		        </a>
		    </c:when>
		    <c:otherwise>
		        <a href="../member/login.jsp" onclick="alert('로그인이 필요합니다.')">
		            <button style="position: absolute; right: 350px; margin:auto; background:#3a8966; text-align:center; color:white; width:75px; height:50px; border-radius:10px; font-size: 17px;">글쓰기</button>
		        </a>
		    </c:otherwise>
		</c:choose>
	</div>
	
	<br><br>
	
	<div id="result">
		<c:forEach items="${list}" var="vo" varStatus="loop">
			<c:choose>
				<c:when test="${not empty sessionScope.loginId}">
					<a href="one?gowith_id=${vo.gowith_id}">
						<div class="content">
							<span style="font-size: 13px;">작성자 ${vo.gowith_writer}</span><br>
							<span style="font-size: 17px; font-weight: bold;nowrap; overflow: hidden; text-overflow: ellipsis; width:300px;">${vo.gowith_title}</span><br>
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
							<span style="font-size: 17px; font-weight: bold;nowrap; overflow: hidden; text-overflow: ellipsis; width:300px;">${vo.gowith_title}</span><br>
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
	</div>
	<div class="paging">
		<%
		int pages = (int)request.getAttribute("pages");
		if (pages == 0) {
		%>
			<div class="content">
				등록된 게시글이 없습니다.
			</div>
		<%	
		} else {
			for (int p = 1; p <= pages; p++) {
		%>
				<button class="pages"><%=p%></button>
		<%
			}
		}
		%>
	</div>
	
	<div class="bottom">
		
	</div>
	
</body>
</html>