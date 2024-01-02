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
	  justify-content: center; /* 내부 요소들을 수평으로 가운데 정렬 */
	  align-items: center; /* 내부 요소들을 수직으로 가운데 정렬 */
	}

	.content {
		margin: 10px;
		padding: 10px;
		width: 300px;
		height: 250px;
		background: lightgray;
		border-radius: 10px;
	}
</style>


<script type="text/javascript">
	$(function() {
		$(".pages").click(function() {
			$.ajax({
				url: "/werin_test/gowith/list0",
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
	<button onclick="insert">글쓰기</button>
	<br><br>
	
	<div id="result">
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
	
</body>
</html>