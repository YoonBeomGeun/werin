<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .author {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }

        .content {
            font-size: 16px;
            line-height: 1.6;
        }
    </style>
<title>Insert title here</title>
<%@ include file = "../../../header.jsp" %>
</head>
<body>

<div class="container">
<h3>게시글 추가</h3>
<form action="trip/insert">
	<label for="title">제목 :</label>
	<input type="text" id="title" name="trip_title" required><br>
	<label for="writer">작성자 :</label> 
	<input type="text" id="writer" name="trip_writer" required><br>
	<label for="country">국가 : </label>
	<input type="text" id="country" name="trip_country" required><br>
 	<!--  <input type="text" id="no" name="no" required><br>
 	<label for="no">번호 : </label>
	<label for="count">조회수 : </label>
	<input type="number" id="count" name="count" required><br> -->
<!-- 작성날짜 : <input name="writedate"><br>-->
	<label for="date">날짜 : </label>
	<input type="date" id="start_date" name="trip_start_date" type="date" value="2023-12-13"> ~ 
	<input type="date" id="end_date" name="trip_end_date" type="date" value="2023-12-13"><br> 
	<label for="content">내용 : </label>
	<input type="text" id="content" name="trip_content" required><br> 
<button type="submit">게시글 작성 완료!</button>
</form>
</div>
</body>
</html>