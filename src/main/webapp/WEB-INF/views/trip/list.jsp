<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/style3.css">
    <title>여행게시글 목록</title>
    <%@ include file = "../../../header.jsp" %>
</head>
<body>
    <div class="container">
        <h3>여행게시글 목록</h3>
        <table border="1">
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여행게시글 목록을 반복하고 각 행을 표시 -->
                <c:forEach items="${list}" var="post" >
                    <tr>
                        <td><a href="trip/one?no=${post.trip_id}">${post.trip_title}</a></td>
                        <td>${post.trip_writer}</td>
                        <td>${post.trip_writedate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>