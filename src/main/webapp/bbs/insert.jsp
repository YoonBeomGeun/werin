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
<%@ include file="../header.jsp"%>
<div id="total">
	<div id="center">
	<br><br>
		<hr color="blue">
		<form action="insert">
			<table border="1"  class="table table-hover">
				<tr class="table-warning">
					<td width="200">카테고리</td>
					<td width="300"><input name="bbs_cate"></td>
				</tr>
				<tr class="table-warning">
					<td width="200">제목</td>
					<td width="300"><input name="bbs_title"></td>
				</tr>
				<tr class="table-warning">
					<td width="200">내용</td>
					<td width="300"><input name="bbs_content"></td>
				</tr>
				<tr class="table-warning" hidden>
					<td width="200">작성자</td>
					<td width="300">
						<input name="bbs_writer" value="${sessionScope.loginId}" >
					</td>
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