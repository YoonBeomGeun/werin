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
	.kan {
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 0 auto;
		width: 50%;
		height:800px;
        padding: 20px;
        color:#285D45;
        box-shadow: 0 0 10px #fbb012;
	}
	
	.in {
		text-align: ;
	}
	
	input {
		width: 50%;
		height: 30px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 10px;
        box-sizing: border-box;
        border-radius:5px;
	}
	
	textarea {
		resize: none;
        border-radius: 10px;
        padding: 10px;
        font-size: 16px;
	}
	
	.btn {
		font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
		background: rgb(251, 176, 18);
	}
	
</style>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="kan">
		<form action="update2" class="in">
			<!-- <h3>몇 사람과 함께 할까요?</h3>
			<select id="dropdown" name="">
		      <option value="1">1 명</option>
		      <option value="2">2 명</option>
		      <option value="3">3 명</option>
		      <option value="4">4 명</option>
		      <option value="5">5 명</option>
		      <option value="6">6 명</option>
		      <option value="7">7 명</option>
		      <option value="8">8 명</option>
		      <option value="9">9 명</option>
		      <option value="10">10 명</option>
		    </select> -->
		    <input type="hidden" name="gowith_id" value="<%=vo.getGowith_id()%>">
			<h3>작성자</h3>
			<input type="text" name="gowith_writer" value="<%=vo.getGowith_writer()%>" disabled="disabled">
			<h3>제목 입력</h3>
			<input type="text" name="gowith_title" value="<%=vo.getGowith_title()%>">
			<h3>내용</h3>
			<textarea rows="15" cols="100" name="gowith_content"><%=vo.getGowith_content()%></textarea><br><br>
			<button type="submit" class="btn">수정하기</button>
		</form>
	</div>
	<div class="bottom" style="height: 50px;">
		
	</div>
	
</body>
</html>