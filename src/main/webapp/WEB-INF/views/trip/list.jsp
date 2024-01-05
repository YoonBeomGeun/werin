<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행게시글 목록</title>
    <%@ include file="../../../header.jsp" %>
    <style>
        body {
            font-family: 'Arial', sans-serif;
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

        h3 {
            color: #3498db;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        button {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>여행게시글 목록</h3>
        <table>
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조회수</th>
                    <th>추천</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여행게시글 목록을 반복하고 각 행을 표시 -->
                <c:forEach items="${list}" var="post" >
                    <tr>
                        <td><a href="one?trip_id=${post.trip_id}">${post.trip_title}</a></td>
                        <td>${post.trip_writer}</td>
                        <td>${post.trip_writedate}</td>
                        <td>${post.trip_count}</td>
                        <td>${post.trip_like}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="tripwrite.jsp"><button>작성</button></a>
    </div>
</body>
</html>
