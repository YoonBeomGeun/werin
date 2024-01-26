<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일정 목록 보여주기</title>
    <style>
        table {
            border-collapse: collapse;
            width: 1000px;
            height: 300px;
        }

        #table {
            display: flex;
            justify-content: center;
        }

        body {
            text-align: center;
        }

        #top {
            padding: 10px;
            background-color: #FBB012;
        }

        .make-button {
            background: #FBB012;
            text-align: center;
            width: 120px;
            height: 40px;
            font: 15px 궁서 bold;
            color: white;
            border-radius: 10px;
            margin-bottom: 10px;
            display: inline-block;
            text-decoration: none;
            line-height: 40px;
            margin-right: 10px; /* 일정 만들기와의 간격을 조절 */
        }
    </style>
</head>
<body>
    <%@ include file="../../../header.jsp"%>

    <div id="select">
        <div>
            <h1 style="display: inline-block;">나의 일정 모아보기</h1>
            <div style="text-align:center;">
                <c:choose>
                    <c:when test="${empty sessionScope.loginId}">
                        <button class="make-button" onclick="alert('로그인이 필요합니다.');">일정 만들기</button>
                    </c:when>
                    <c:otherwise>
                        <a class="make-button" href="${pageContext.request.contextPath}/plan/plan.jsp">일정 만들기</a>
                    </c:otherwise>
                </c:choose>
                <a class="make-button" href="${pageContext.request.contextPath}/plan/planalllist">일정 둘러보기</a>
            </div>
        </div>
        <div id="table">
            <table border="1">
                <thead>
                    <tr>
                        <th id="top">제목</th>
                        <th id="top">여행날짜</th>
                        <th id="top">누구랑</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${plan}" var="plan">
                        <tr>
                            <td><a href="${pageContext.request.contextPath}/plan/plan_detail?plan_no=${plan.plan_no}">${plan.plan_title}</a></td>
                            <td>${plan.plan_start_date}~${plan.plan_start_date}</td>
                            <td>${plan.plan_with}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>