<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
     <link rel="stylesheet" type="text/css" href="resources/css/member.css">
     <script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	//jquery는 버튼하나당 함수하나!, 요청하나당 함수하나!
	//특정한 이벤트가 발생하기를 기다렸다가
	//이벤트가 발생하면 
	//자동으로  함수를 실행시켜주는 방식의 함수를 사용함.
	//콜백함수
	//body를 먼저 브라우저가 읽도록 하는 코드를 넣어주어야함.
	function fn_idChk(){
			$.ajax({
				url : "idChk",
				type : "post",
				dataType : "json",
				data : {"id" : $("#id").val()},
				success : function(x){
					if(x == 1){
						alert("중복된 아이디입니다.");
					}else if(x == 0){
						$("#id").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
	}
	
	function passConfirm() {
			var password = document.getElementById('pw');	
			var password2 = document.getElementById('pw2');	
			var massage_on = document.getElementById('massage');
			
			if(pw.value == pw2.value){
				massage_on.style.color = "green";
				massage_on.textContent ="비밀번호가 일치합니다!!";
			}else{
				massage_on.style.color = "red";
				massage_on.textContent ="비밀번호가 불일치합니다. 다시 입력해주세요.";
			}
	}
</script>
</head>
<body>
	<div class="container">
    <h2>회원가입</h2>

<form action="insert">
ID : <input name="id" id="id"><br>
<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">ID 중복확인</button><br>
비밀번호 :<input type="password" name="pw" id="pw"><br>
비밀번호 확인 : <input type="password" name="pw2" id="pw2" onkeyup="passConfirm()"> <span id ="massage"></span><br>
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