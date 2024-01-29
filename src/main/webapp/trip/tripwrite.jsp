<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { 
            font-family: 'Arial', sans-serif;
            background-color: #fff;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {  /* 흰색 부분 */
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px #fbb012;
        }

        .form-group { 
            margin-bottom: 15px;
            overflow: hidden; /* Add this to clear floats */
        }

        .date-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        label {
            display: none;
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

        input[type="date"] {
            height: 30px;
        }

        textarea {
            height: 200px;
            resize: none;
        }
	  .submit-button {  /* 게시글 작성 버튼 */
            background-color: #fbb012;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
         margin-left: auto; /* submit 버튼을 오른쪽에 배치 */
            display: block; /* display: block; 추가 */
        }

        .submit-button:hover {
            background-color: gold;
        }
        #writer {
   		 width: 50%; /* 작성자 입력란의 너비를 50%로 설정 */
			}
    </style>
    
    <title>게시글 추가</title>
    <%@ include file="../header.jsp" %>
</head>
<body>
    <div class="container">
        <h3>제주도 여행기 작성</h3>
        <form action="${pageContext.request.contextPath}/trip/insert" method="post">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="trip_title" placeholder="제목을 입력해주세요" required><br>
            </div>
            <div class="form-group">
                <label for="writer">닉네임</label> <!-- memberVO에 있는 member_nickname을 작성자 value로 고정 -->
                <input type="text" id="nickname" name = "member_nickname" value = "${sessionScope.nickname}" readonly><br>
            </div>
            <input type= "hidden" name ="trip_writer" value = "${loginId}">
            <div class="form-group date-group">
                <label for="start_date">출발 날짜</label>
                <input type="date" name="trip_start_date" required>
                <span>~</span>
                <label for="end_date">도착 날짜</label>
                <input type="date" name="trip_end_date" required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="trip_content" placeholder="내용을 입력해주세요" required></textarea> 
            </div>
            <button class="submit-button" type="submit">게시</button>
        </form>
    </div>
</body>
</html>
