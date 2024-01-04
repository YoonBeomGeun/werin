<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 작성</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bbs.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>     
<script type="text/javascript">
</script>
</head>
<body>
<div id="total">
	<div id="center">
	<br><br>
		<%-- <% if(session.getAttribute("id") != null ) { %>
			<%= session.getAttribute("id") %>님 환영합니다.
			<a href="logout.jsp">
				<button class="btn btn-outline-danger">로그아웃</button>
			</a>
		<% } %> --%>
		<hr color="blue">
		<form action="insert2">
			<table border="1"  class="table table-hover">
				<tr class="table-warning">
					<td width="200">카테고리</td>
					<td width="300"><input name="cate"></td>
				</tr>
				<tr class="table-warning">
					<td width="200">제목</td>
					<td width="300"><input name="title"></td>
				</tr>
				<tr class="table-warning">
					<td width="200">내용</td>
					<td width="300"><input name="content"></td>
				</tr>
				<tr class="table-warning">
					<td width="200">작성자</td>
					<td width="300">
						<input name="writer" value="${bbs_id}">
					</td>
					<%-- ${id} == <%= session.getAttribute("bbs_id}") %> --%>
				</tr>
				<tr class="table-primary">
					<td colspan="2" width="200">
						<button type="submit" class="btn btn-primary">글쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</div>
</body>
</html>