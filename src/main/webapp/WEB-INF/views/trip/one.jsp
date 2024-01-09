<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.multi.werin.trip.TripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    TripVO bag = (TripVO)request.getAttribute("vo");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String formattedDate = dateFormat.format(bag.getTrip_writedate());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기 상세 정보</title>
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

        div {
            margin-top: 20px;
        }

        p {
            font-size: 16px;
            margin-bottom: 10px;
        }

        strong {
            font-weight: bold;
        }

        button {
            background-color: #e74c3c;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>여행기 상세 정보</h3>
        <div>
            <p><strong>제목:</strong> ${vo.trip_title}</p>
            <p><strong>작성 날짜:</strong> <%= formattedDate %></p>
            <p><strong>조회수:</strong> ${vo.trip_count}</p>
            <p><strong>추천:</strong> ${vo.trip_like}</p>
            <p><strong>작성자:</strong> ${vo.trip_writer}</p>
            <p><strong>내용:</strong> ${vo.trip_content}</p>
        </div>
        <button onclick="remove()">삭제</button>
        <button onclick="update()">수정</button>
        <a href = "${pageContext.request.contextPath}/trip/list"><button>돌아가기</button></a>

        <script>
            function remove() {
                if (confirm("게시글을 삭제하시겠습니까?")) {
                    location.href = "remove?trip_id=<%=bag.getTrip_id()%>";           
                } 
            }

            function update() {
                if (confirm("게시글을 수정하시겠습니까?")) {
                    location.href = "update?trip_id=<%=bag.getTrip_id()%>";           
                } 
            }
        </script>
    </div>
</body>
</html>
