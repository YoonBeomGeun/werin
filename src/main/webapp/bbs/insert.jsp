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
<%@ include file="../header.jsp" %>
	<div id="center">
		<br><br>
		<hr color="blue">
		<form action="insert2">
				<table border="1"  class="table table-hover">
					<tr class="table-warning">
						<td width="200">제목</td>
						<td width="300"><input name="title"></td>
					</tr>
					<tr class="table-warning">
   					 	<td width="200">내용</td>
    					<td width="300"><textarea name="content" rows="8" class="input-field"></textarea></td>
					</tr>
					
				</table>
				<input type="file" name="file"><br>
				<button type="submit">글쓰기</button>
		</form>
	</div>
</body>
</html>