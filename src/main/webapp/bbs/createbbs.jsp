<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>북마크 추가</h3>
<form action="insert">
태그 : <input name="cate"><br>
제목 : <input name="title"><br>
내용 : <input name="content"><br>
작성자 : <input name="writer"><br>
<button type="submit">서버로 전송</button>
</form>
</body>
</html>