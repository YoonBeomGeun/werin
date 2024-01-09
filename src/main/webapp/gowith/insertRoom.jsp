<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
	<h2>방 생성하기</h2>
	<form action="insertRoom">
		<input type="hidden" name="gowith_id" value="31">
		방이름: <input type="text" name="room_name" value="tyttttttt">
		<button type="submit">전송</button>
	</form>
	
	
</body>
</html>