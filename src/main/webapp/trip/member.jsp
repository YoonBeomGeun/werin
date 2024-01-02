<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
     <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<body>
	<div class="container">
    <h2>회원가입</h2>

<form action="insert">
ID : <input name="id"><br>
비밀번호 : <input name="pw"><br>
이름 : <input name="name"><br>
전화번호 : <input name="tel"><br>
주소 : <input name="addr"><br>
이메일 : <input name="email"><br>
<div class="label-container">
성별 : <br>
      <input type="radio" name="gender" value="남자" id="male"><label for="male">남자</label>
      <input type="radio" name="gender" value="여자" id="female">
      <label for="female">여자</label><br>
</div>
<button type="submit">회원가입 신청</button>
</form>
</div>
</body>
</html>