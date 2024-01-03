<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/style2.css">
<title>Insert title here</title>
</head>
<body>

<h3>게시글 검색</h3>
<form action="one_bbs">
작성자 : <input type="text" name="writer"><br>
<button type="submit">서버로 전송</button>
</form>
<hr>

<h3>게시글 전체검색</h3>
<a href="list"><button>전체 검색 요청</button></a>
<hr>

<h3>게시글 추가</h3>
<form action="insert_bbs">
제목 : <input name="title"><br>
작성자 : <input name="writer"><br>
국가 : <input name="country"><br>
번호 : <input name="no"><br>
조회수 : <input name="count"><br>
날짜 : <input name="start_date" type="date" value="2023-12-13"> ~ <input name="end_date" type="date" value="2023-12-13"><br> 
내용 : <input name="content"><br> 
<button type="submit">서버로 전송</button>
</form>
<hr>

<h3>게시글 수정</h3>
<form action="update">
작성자 : <input name="writer"><br>
내용 : <input name="content"><br>
<button type="submit">서버로 전송</button>
</form>

</body>
</html>