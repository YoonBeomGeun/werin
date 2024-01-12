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
	    background: pink;
	    margin-right: 5px;
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
		background: lightgray;
		border-radius: 10px;
	}
	
	.content p {
		margin: 10px 0;
	}
	
	.content mit {
		position: fixed;	/* 어떻게 수정해야 할지 모르겠음 */
	}
	
	.bottom {
		background: lightgray;
		height: 300px;
		margin-top: 50px;
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
	<h1 style="text-align:center;">동행게시판</h1>
	<div><input type="text" value="검색어를 입력하세요."></div>
	<div>최신순</div>
	<div>추천순</div>
	<div>조회순</div>
	<div>조회기간</div>
	<% 
		if(session.getAttribute("loginId") != null){	
	%>
		<a href="insertGowith.jsp"><button>글쓰기</button></a>
	<%
		} else {
	%>
		<a href="../member/login.jsp" onclick="alert('로그인이 필요합니다.')"><button>글쓰기</button></a>
	<%
		}
	%>
	<br><br>
	
	<div id="result">
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
	</div>
	<div class="paging">
		<%
		int pages = (int)request.getAttribute("pages");
		if (pages == 0) {
		%>
			등록된 게시글이 없습니다.
			<!-- 꾸며주기 -->
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
		<h2 style="margin-left:225px;">werin</h2>
		
	</div>
	
</body>
</html>