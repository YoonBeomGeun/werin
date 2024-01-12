<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.multi.werin.trip.TripVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%
    TripVO bag = (TripVO)request.getAttribute("vo");
	//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//String formattedDate = dateFormat.format(bag.getTrip_writedate());
%>
<script>
$(function() {
	$('#like').click(function() {
		alert("xxx")
	})
})
	 
     
</script>
</head>
<body>
<button class="like-btn"  id = "like">추천 </button>
</body>
</html>