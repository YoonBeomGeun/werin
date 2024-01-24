<%@page import="com.multi.werin.trip.TripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        .form-group {
            margin-bottom: 15px;
            overflow: hidden; /* Add this to clear floats */
        }
         input,
        select,
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        
        textarea {
            height: 200px;
            resize: none;
        }
        
          /* 버튼 스타일 */
        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            color: #fff;
        }

        .update-btn {
            background-color: #3498db;
            margin-right: 150px;
        }

        .return-btn {
            background-color: #2ecc71;
        }
        </style>

<title>Insert title here</title>
<%@ include file="../../../header.jsp"%>

 </head>
<body>
<div class="container">
        <h3>여행기 상세 정보</h3>
        <div>
        <form action = "${pageContext.request.contextPath}/trip/update2">
         <div class="form-group" id = "d1">
            <label for="trip_title">제목</label> 
            <input name = trip_title id = "trip_title" value = ${vo.trip_title}><br>
         </div>
         <div class="form-group">
            <label for="trip_content">내용</label>
            <textarea id = "trip_content" name = trip_content>${vo.trip_content}</textarea>
         </div>
            <input type = "hidden" name = "trip_id" value = ${vo.trip_id}>
        <button class="update-btn">수정</button>
        </form>
        <a href = "${pageContext.request.contextPath}/trip/list?page=1"><button class = "return-btn">돌아가기</button></a>
        </div>
</div>
</body>
</html>