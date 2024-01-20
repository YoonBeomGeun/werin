<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 목록 보여주기</title>
</head>
<body>
<%@ include file="../header.jsp"%>

<div id="planList">
    <h3>일정게시글 목록</h3>
    <table border="1">
        <thead>
            <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>여행날짜</th>
            </tr>
        </thead>
        <tbody>
            <!-- 여행게시글 목록을 반복하고 각 행을 표시 -->
            <c:forEach items="${planList}" var="plan"> <!-- 수정된 부분 -->
                <tr>
                    <td>${plan.plan_title}</td>
                    <td>${plan.plan_writer}</td>
                    <td>${plan.plan_start_date}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>