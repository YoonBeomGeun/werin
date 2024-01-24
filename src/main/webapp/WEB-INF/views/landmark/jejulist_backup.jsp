<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>랜드마크 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
        }

        .landmark {
            width: 300px;
            margin: 10px;
            padding: 10px;
            border: 1px solid #dddddd;
            box-sizing: border-box;
        }

        .landmark img {
            max-width: 100%;
            height: auto;
        }

        .landmark-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .landmark-content-id {
            color: #555;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 
    
    
</head>
<body>
    <h2>랜드마크 정보</h2>
    <hr>
    <div class="container">
        <!-- 목록을 반복하며 각 랜드마크를 표시합니다. -->
        <c:forEach var="landmark" items="${list}">
            <div class="landmark">
                <div class="landmark-title">
                    <a href="jejulist2.jsp">${landmark.landmarkinfo_name}</a>
                </div>
                <div class="landmark-image">
                    <c:if test="${not empty landmark.landmarkinfo_pic}">
                        <a href="your_condition.jsp?pic=${landmark.landmarkinfo_pic}">
                            <img src="${landmark.landmarkinfo_pic}" alt="랜드마크 이미지">
                        </a>
                    </c:if>
                </div>
                <div class="landmark-content-id">
                    ID: ${landmark.landmarkinfo_contentid}
                </div>
            </div>
        </c:forEach>
    </div>
    ${pages}

    <hr>
    불러오기 성공
</body>
</html>