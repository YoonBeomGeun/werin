<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int result = (int) request.getAttribute("result");
if (result == 1) {
%>
	여행기 수정이 완료됐습니다.
	<a href = "list.jsp">여행기 목록으로 돌아가기</a>
	<%
	} else {
%>
	실패했습니다.<%
	}
%>

</body>
</html>