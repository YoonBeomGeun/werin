<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.kan {
		margin-left: 30%;
        padding: 20px;
	}
	
	.in {
		text-align: ;
	}
	
	.btn {
		font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
		background:#00CC66;
	}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="kan">
		<form action="insert" class="in">
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
		    </select>
			
			<h3>여행 날짜를 선택해 주세요.</h3>
			<input type="date"> ~ <input type="date"> -->
			<h3>작성자</h3>
			<input type="text" name="gowith_writer">
			<h3>제목 입력</h3>
			<input type="text" name="gowith_title">
			<h3>내용</h3>
			<textarea rows="15" cols="100" name="gowith_content"></textarea><br>
			<button type="submit" class="btn">등록하기</button>
		</form>
	</div>
	
</body>
</html>