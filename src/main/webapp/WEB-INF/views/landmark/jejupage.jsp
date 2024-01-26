<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Landmark Information</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

         .container {
            max-width: 1200px;
            display: flex; /* Flexbox를 사용하여 아이템을 가로 중앙에 배치 */
            justify-content: center; /* 가로 중앙 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            margin: 20px auto; /* 위아래 여백을 조절하여 세로 중앙 배치를 위한 방법 */
            flex-wrap: wrap; /* 필요하다면 요소들을 여러 줄에 걸쳐 표시할 수 있도록 함 */
        }

        .landmark {
            border: 2px solid #fbb012;
            margin: 10px;
            padding: 10px;
            text-align: center;
            width: 1000px; /* 예시로 너비를 설정 */
        }

        img {
            max-width: 100%;
            height: 100%;
            object-fit : cover;
        }

        hr {
            margin: 20px 0;
            border: 0;
            border-top: 1px solid #ddd;
        }
    </style>

    <%@ include file="../../../header.jsp" %>
</head>
<body>
    <h1 align="center" style="color: orange;">제주도의 관광지를 만나보세요!</h1>
    <div class="container">
        <c:forEach var="landmark" items="${list2}">
            <div class="landmark">
                <h2 style="text-align: center;">${landmark.title}</h3>
                <div style="text-align: center;">
                <object data = "${landmark.firstImage2}" type = "image/jpg" width = "400" height ="300">
                <img src="${landmark.firstImage2}" alt="Landmark Image">
                </object></div>
                <p class = "addr"><strong>주소:</strong> ${landmark.addr1}</p>
                <p><strong>홈페이지:</strong> ${landmark.homepage}</p>
                <p><strong>전화번호:</strong> ${landmark.tel}</p>
                <p><strong>소개:</strong> ${landmark.overview}</p>
            </div>
        </c:forEach>
    </div>

    <hr>
    불러오기 성공
</body>
</html>
