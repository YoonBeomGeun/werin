<%@page import="com.multi.werin.trip.TripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		TripVO bag = (TripVO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/style4.css">
    <title>여행기 상세 정보</title>
    <%@ include file = "../../../header.jsp" %>
</head>
<body>
    <div class="container">
        <h3>여행기 상세 정보</h3>
        <div>
            <p><strong>작성자:</strong> ${vo.trip_writer}</p>
            <p><strong>제목:</strong> ${vo.trip_title}</p>
            <p><strong>여행한 곳:</strong> ${vo.trip_country}</p>
            <p><strong>작성 날짜:</strong> ${vo.trip_writedate}</p>
            <p><strong>내용:</strong> ${vo.trip_content}</p>
        </div>
        <button onclick="remove()">삭제 </button>
        <button onclick="update_bbs()">수정</button>
        
  
<script>
    function remove() {
        if (confirm("게시글을 삭제하시겠습니까?")) {
            location.href = "remove?Trip_id=<%=bag.getTrip_id()%>";           
        } 
    }
    
    function update_bbs() {
        if (confirm("게시글을 수정하시겠습니까?")) {
            location.href = "update_bbs?Trip_id=<%=bag.getTrip_id()%>";           
        } 
    }
</script>
    </div>
</body>
</html>