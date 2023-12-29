<%@page import="com.multi.werin.trip.TripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
        <h3>여행기 상세 정보</h3>
        <div>
        <form action = "update_bbs2">
            <p><strong>제목:</strong> <input name = title value = ${vo.trip_title}></p>
            <p><strong>여행한 곳:</strong> <input name = country value = ${vo.trip_country}></p>
            <p><strong>내용:</strong> <input name = content value = ${vo.trip_content}></p>
            <input type = "hidden" name = "id" value = ${vo.trip_id}>
        <button>수정</button>
        </form>
        </div>
</div>
</body>
</html>