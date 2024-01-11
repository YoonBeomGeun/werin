<%@page import="com.multi.werin.bbs.BbsVO"%>
<%@page import="com.multi.werin.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    BbsVO bag = (BbsVO)request.getAttribute("bag");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
	<div id="container">
		<form action="update2">
			<input name="bbs_id" value="<%=bag.getBbs_id()%>" type="hidden">
			<table class="table table-bordered table table-hover">
				<tr>
					<td class="table table-warning">제목</td>
					<td><input name="bbs_title"	value="<%=bag.getBbs_title()%>"></td>
				</tr>
				<tr>
					<td class="table-warning">내용</td>
					<td>
						<textarea name="bbs_content" rows="5" cols="100"><%=bag.getBbs_content()%></textarea>
					</td>
				</tr>
				<tr>
					<td class=" table table-warning">작성자</td>
					<td><input name="bbs_writer" value="<%=bag.getBbs_writer()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<button type="submit" class="btn btn-info">글수정하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
</body>
</html>