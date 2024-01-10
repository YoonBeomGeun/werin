<%@page import="com.multi.werin.chat.RoomVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	RoomVO vo = (RoomVO)request.getAttribute("roomVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#result {
		background: lightgray;
		width: 850px;
		height: 80vh;
		display: flex;
		margin: 0 auto;
		border-radius: 15px;
	}
	
	.write {
	    display: flex;
	    justify-content: space-between; /* 내부 요소 사이의 간격을 벌리기 위해 사용합니다. */
	    align-items: center;
	    position: fixed;
	    bottom: 10px;
	    left: 50%;
	    transform: translateX(-50%);
	    width: calc(100% - 20px); /* 화면 가로 길이에서 여백 20px만큼 빼줍니다. */
	    max-width: 850px; /* 최대 너비 설정 */
	    height: 70px;
	    background: lightgray;
	    border-radius: 15px;
	    padding: 0 10px; /* 내부 여백 설정 */
	}
	
	.write button {
		font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
	}
</style>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<h3 style="text-align: center; "><%=vo.getRoom_name()%></h3>
	
	<div id="result" style="">
		
	</div>
	<div style="height:90px;"></div>
	<div class="write">
    	<textarea id="" rows="4" cols="170" placeholder="메세지를 입력하세요."></textarea>
    	<button id="b1" style="background: #33CC99;">입력</button>
	</div>
</body>
</html>