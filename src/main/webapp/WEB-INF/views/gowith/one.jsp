<%@page import="com.multi.werin.gowith.GowithVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GowithVO vo = (GowithVO)request.getAttribute("vo");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1 {
		margin-left: 225px;
		margin-top: 112px;
	}
	
	.info {
		color: #007700;
	}
	
	.schedule {
		background: lightgray;
		width: 500px;
		height: 300px;
		display: flex;
		margin: 0 auto;
	}
	
	.edit button {
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
	<h1 style="margin-top:50px;"><%= vo.getGowith_title()%></h1>
	<p style="margin-left:225px; font-weight: bold;">작성자: <%= vo.getGowith_writer()%></p>
	<table class="info" style="margin-left:225px;">
		<tr>
			<td>조회수 I</td>
			<td>메세지 I</td>
			<td>댓글</td>
		</tr>
		<tr>
			<td>조회수  </td>
			<td>채팅방수  </td>
			<td>댓글수</td>
		</tr>
	</table>
	<button style="margin-right:225px; background:#FF5555; color:white; width:70px; height:50px; border-radius:10px; float:right; font-size: 17px;">좋아요</button>
	<h3 style="text-align:center; margin-top:50px;">여행 일정</h3>
	<div class="schedule">
		여행 일정 들어오기
	</div>
	<h2 style="margin-left:225px; margin-top:30px;">내용</h2>
	<p style="margin-left:225px;"><%= vo.getGowith_content()%></p>
	<div class="edit" style="text-align: right; margin-right: 225px;">
		<a href="update?gowith_id=<%=vo.getGowith_id()%>"><button style="background:#33CC99;">수정</button></a>
		<a href="deleteConfirmed?gowith_id=<%=vo.getGowith_id()%>"><button style="background:#FF5555;">삭제</button></a>
	</div>
	<br>
	<hr color="green">
	<h2 style="margin-left:225px; margin-top:30px;">댓글</h2>
	<!-- if문 추가 -->
	<div>
		등록된 댓글이 없습니다.
	</div>
</body>
</html>