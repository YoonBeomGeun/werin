<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="member.css">
<title>Login Page</title>
<%@ include file="../header.jsp"%>
</head>
<body>
	<div class="login-container">
		<h2>Login</h2>
		<%
			String state = request.getParameter("state");
		if (state != null) {
			if (state.equals("0")) {
		%>
		<script>
			alert('아이디 혹은 비밀번호를 다시 확인해주세요.')
		</script>
		<%
			}
		}
		%>
		<form id="loginForm" action="loginProcess" method="post">
			<label for="id">ID:</label> <input type="text" id="id" name="id"
				required> <label for="pw">Password:</label> <input
				type="password" id="pw" name="pw" required>

			<button type="submit">로그인</button>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="your_script.js"></script>

</body>
</html>