<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
    <title>Login Page</title>
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div class="container">
        <h2>로그인</h2>
        <form id="loginForm" action="loginProcess" method="post">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" required>

            <label for="pw">Password:</label>
            <input type="password" id="pw" name="pw" required>

            <button type="submit">로그인</button>
        </form>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="your_script.js"></script>
</body>
</html>