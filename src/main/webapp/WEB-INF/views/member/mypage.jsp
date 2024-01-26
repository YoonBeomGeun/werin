<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
	<%@ include file="../../../header.jsp"%>
	<div class="container">
		<h2>회원가입</h2>


		<form action="insert">
			ID : <input name="member_id" id="member_id">
			<br> 비밀번호 :<input type="password" name="member_pw" id="pw"><br>
			비밀번호 확인 : <input type="password" name="pw2" id="pw2"
				onkeyup="passConfirm()"> <span id="massage"></span><br>
			이름 : <input name="member_name"><br> 닉네임 : <input
				name="member_nickname"><br> 전화번호 : <input
				name="member_tel"><br> 이메일 : <input name="member_email"><br>
			<div class="label-container">
				성별 : <input type="radio" name="member_gender" value="남자" id="male"><label
					for="male">남자</label> <input type="radio" name="member_gender"
					value="여자" id="female"> <label for="female">여자</label><br>
			</div>
			<button type="submit">수정</button>
		</form>
	</div>
</body>
</html>