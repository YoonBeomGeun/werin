<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	게시글 수정이 완료됐습니다.

	<%
	int result = (int) request.getAttribute("result");
if (result == 1) {
%>
	성공했습니다.
	<%
	} else {
%>
	실패했습니다.<%
	}
%>

</body>
</html>